public class HousingApplicationController {
	private HousingApplication.Form hapForm;
	public String clientId {get; set;}
	public String initialState {get; set;}
	public HousingApplication.PDFResult[] pdfResults {get; set;}
	public String status {get; set;}
	/** actionFunction submitData passes formData **/
	public String formData {get; set;}

	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapForm = new HousingApplication.Form(clientId);
		initialState = hapForm.toJSON();
		status = 'READY';
	}

	public void submit(){
		status = 'FETCHING';
		pdfResults = fetchPDFs();
		status = 'GENERATED';
		for(HousingApplication.PDFResult r :pdfResults){
			r.status = 'DOWNLOADING';
			Blob pdf = downloadPDF(r.url);
			r.status = 'UPLOADING';
			r.status = uploadToBox(pdf);
		}
		status = 'COMPLETE';
	}

	public HousingApplication.PDFResult[] fetchPDFs(){
		return hapForm.fetchPDFs(formData);
	}

	public Blob downloadPDF(String url){
		return HousingApplication.downloadPDF(url);
	}

	public String uploadToBox(Blob pdf){
		return 'SUCCESS';
	}
}
