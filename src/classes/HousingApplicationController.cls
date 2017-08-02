public class HousingApplicationController {
	private HousingApplication.Form hapForm;
	private HousingApplication.BoxPDFUploader uploader;
	transient HousingApplication.PDFResult[] pdfResults;
	transient Attachment[] attachments;
	private Id[] attachmentIds;

	public HousingApplication.Building[] buildings {get; set;}
	public Client__c client {get; set;}
	public String clientId {get; set;}
	public String hapCaseId {get; set;}
	public String initialState {get; set;}
	public String status {get; set;}
	public String pdfJSONResults {get; set;}
	/** actionFunction fetchPDFs passes formData **/
	public String formData {get; set;}
	public String fetchBuilding {get; set;}

	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapCaseId = ApexPages.currentPage().getParameters().get('hapCaseId');
		hapForm = new HousingApplication.Form(clientId);
		client = hapform.client.client; // ew, gross.
		buildings = HousingApplication.getBuildingData();
		attachments = new List<Attachment>();
		attachmentIds = new List<Id>();

		JSONGenerator gen = JSON.createGenerator(false);
		gen.writeStartObject();
		gen.writeObjectField('form', hapForm.data);
		gen.writeObjectField('buildings', buildings);
		gen.writeEndObject();
		initialState = gen.getAsString();

		pdfResults = new List<HousingApplication.PDFResult>();
		pdfJSONResults = JSON.serialize(pdfResults);

		uploader = new HousingApplication.BoxPDFUploader();
		status = 'READY';
	}

	public void createFolder(){
		uploader.createOrGetFolder(hapCaseId);
		uploader.commitChanges();
	}

	public void fetchPDFs(){
		pdfResults = new List<HousingApplication.PDFResult>();
		transient HousingApplication.PDFResult pdfResult = hapForm.fetchPDFs(formData);

		if(pdfResult.status != 'OK'){
			status = 'PDF_FETCHED';
			return;
		}
		pdfResults.add(pdfResult);

		attachments = uploader.createAttachments(pdfResults, hapCaseId);
		insert attachments;
		for(Attachment a : attachments)
			attachmentIds.add(a.Id);
		status = 'PDF_FETCHED';
	}

	public void uploadPDFsToBox(){
		attachments = [
			SELECT Id, Name, Body, ParentId
			FROM Attachment
			WHERE Id IN :attachmentIds
		];

		uploader.uploadAttachments(attachments);
		uploader.commitChanges();
		delete attachments;
		status = 'COMPLETE';
	}
}
