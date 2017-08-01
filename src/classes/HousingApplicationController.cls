public class HousingApplicationController {
	private HousingApplication.Form hapForm;
	private HousingApplication.BoxPDFUploader uploader;
	transient HousingApplication.PDFResult[] pdfResults;
	transient Attachment[] attachments;
	private Id[] attachmentIds;

	public HousingApplication.Building[] buildings {get; set;}
	public String clientId {get; set;}
	public String hapCaseId {get; set;}
	public String initialState {get; set;}
	public String status {get; set;}
	public String pdfJSONResults {get; set;}
	/** actionFunction fetchPDFs passes formData **/
	public String formData {get; set;}

	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapCaseId = ApexPages.currentPage().getParameters().get('hapCaseId');
		hapForm = new HousingApplication.Form(clientId);
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
		//pdfJSONResults = JSON.serialize(pdfResults);
		pdfResults = new List<HousingApplication.PDFResult>();
		transient HousingApplication.PDFResult pdfResult = hapForm.fetchPDFs('3treeflats', formData);
		pdfResults.add(pdfResult);

		attachments = uploader.createAttachments(pdfResults, hapCaseId);
		insert attachments;
		for(Attachment a : attachments)
			attachmentIds.add(a.Id);
		status = 'PDFS_READY';
	}

	public void uploadPDFsToBox(){
		attachments = [
			SELECT Id, Name, Body, ParentId
			FROM Attachment
			WHERE Id IN :attachmentIds
		];
		system.debug(attachments);
		uploader.uploadAttachments(attachments);
		uploader.commitChanges();
		delete attachments;
		status = 'COMPLETE';
	}
}
