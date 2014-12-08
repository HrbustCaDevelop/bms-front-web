var ioc = {
    accountService : {
		type : "com.ca.service.impl.AccountServiceImpl",
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	acountController : {
		type : "com.ca.controller.AcountController",
		fields : {
			accountService : {
				refer : 'accountService'
			}
		}
	},
	dataService : {
		type : "com.ca.service.impl.DataServiceImpl",
		fields : {
			dao : {
				refer : 'dao'
			}
		}
	},
	dataController : {
		type : "com.ca.controller.DataController",
		fields : {
			dataService : {
				refer : 'dataService'
			}
		}
	}
}