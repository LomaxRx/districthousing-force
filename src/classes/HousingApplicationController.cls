public class HousingApplicationController {
	private HousingApplication.Form hapForm;
	private HousingApplication.BoxPDFUploader uploader;
	private HousingApplication.PDFResult[] pdfResults;

	public HousingApplication.Building[] buildings {get; set;}
	public String clientId {get; set;}
	public String initialState {get; set;}
	public String status {get; set;}
	public String pdfJSONResults {get; set;}
	/** actionFunction fetchPDFs passes formData **/
	public String formData {get; set;}

	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapForm = new HousingApplication.Form(clientId);
		buildings = HousingApplication.getBuildingData();

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

	public void fetchPDFs(){
		pdfResults = hapForm.fetchPDFs(formData);
		pdfJSONResults = JSON.serialize(pdfResults);
		status = 'PDFS_READY';
	}

	public void uploadPDFsToBox(){
		for(HousingApplication.PDFResult r :pdfResults){
			Blob pdf = downloadPDF(r);
			if(pdf==null) continue;
			uploadPDF(r, pdf);
		}
		uploader.commitChanges();
		status = 'COMPLETE';
	}

	private Blob downloadPDF(HousingApplication.PDFResult r){
		try{
			Blob pdf = HousingApplication.downloadPDF(r.url);
			r.status = 'PDF_DOWNLOADED';
			return pdf;
		} catch (Exception e){
			r.status = 'FAILED_PDF_DOWNLOAD';
			return null;
		}
	}

	private void uploadPDF(HousingApplication.PDFResult r, Blob pdf){
		try{
			String name = System.now().format('yyyy-mm-dd HH:mm') + ' ' + r.building + '.pdf';
			BoxFile.Info fileInfo = uploader.upload(pdf, hapForm.client.hapCase.Id, name);
			System.debug(fileInfo);
			r.status = 'PDF_UPLOADED_TO_BOX';
		} catch (Exception e){
			r.status = 'FAILED_PDF_UPLOAD_TO_BOX';
			System.debug(e);
		}
	}
}
