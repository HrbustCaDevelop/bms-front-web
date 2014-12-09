var ioc = {
    accountService : {
		type : "com.ca.bms.show.service.impl.AccountServiceImpl"
	},
	dataService : {
		type : "com.ca.service.impl.DataServiceImpl"
	},
	acountController : {
		type : "com.ca.bms.show.controller.AcountController",
		fields : {
			accountService : {
				refer : 'accountService'
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