public class HousingApplicationController {
	private HousingApplication.Form hapForm;
	private HousingApplication.BoxPDFUploader uploader;

	public String clientId {get; set;}
	public String initialState {get; set;}
	public HousingApplication.PDFResult[] pdfResults {get; set;}
	public String pdfJSONResults {get; set;}
	public String status {get; set;}
	/** actionFunction fetchPDFs passes formData **/
	public String formData {get; set;}

	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapForm = new HousingApplication.Form(clientId);
		initialState = hapForm.toJSON();

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
			downloadPDF(r);
			if(r.status=='FAILED_PDF_DOWNLOAD') continue;
			uploadPDF(r);
		}
		uploader.commitChanges();
		status = 'COMPLETE';
	}

	private void downloadPDF(HousingApplication.PDFResult r){
		try{
			r.pdf = HousingApplication.downloadPDF(r.url);
			r.status = 'PDF_DOWNLOADED';
		} catch (Exception e){
			r.status = 'FAILED_PDF_DOWNLOAD';
		}
	}

	private void uploadPDF(HousingApplication.PDFResult r){
		try{
			String name = System.now().format('yyyy-mm-dd HH:mm') + ' ' + r.building + '.pdf';
			uploader.upload(r.pdf, hapForm.client.hapCase.Id, name);
			r.status = 'PDF_UPLOADED_TO_BOX';
		} catch (Exception e){
			r.status = 'FAILED_PDF_UPLOAD_TO_BOX';
		}
	}
}
