component extends="coldbox.system.testing.BaseModelTest" {

	this.loadColdbox   = true;
	this.unLoadColdbox = false;

	function beforeAll(){
		super.beforeAll();

		// setup the model
		super.setup();

		// init the model object
		model.init();

		getWirebox().autowire( variables.model );
	}

	function afterAll(){
		super.afterAll();
	}

}
