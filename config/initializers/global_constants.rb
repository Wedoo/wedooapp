module Constants
    PAYPAL_MODES = ["sandbox", "live"]
    PAYPAL_ENDPOINTS = {
    	:sandbox => "api.sandbox.paypal.com",
    	:live  => "api.paypal.com"
    } 

    CAMPAIGN_STATUS=["DELETED","ACTIVE", "PAUSED"]
end