public class HousingApplicationController {
	public String clientId {get; set;}
	public String initialState {get; set;}
	private HousingApplication.Form hapForm;
	public HousingApplicationController() {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
		hapForm = new HousingApplication.Form(clientId);
		initialState = hapForm.toJSON();
	}
}
