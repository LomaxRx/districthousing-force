public class HousingApplicationController {
	public String clientId {get; set;}
	public HousingApplicationController(ApexPages.StandardController controller) {
		clientId = ApexPages.currentPage().getParameters().get('clientId');
	}
}
