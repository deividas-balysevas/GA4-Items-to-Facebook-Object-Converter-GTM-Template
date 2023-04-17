___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Items to Google Ads Array Converter",
  "description": "The GA4 Items to Google Ads Array Converter is a tool or script that helps convert GA4 items data into a format that is compatible with Google Ads.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const dl = require('copyFromDataLayer');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');

const event = dl('event');
const ecommerce = dl('ecommerce', 1);

const ga4Events = ['view_item_list', 'select_item', 'view_item', 'remove_from_cart', 'add_to_cart', 'add_to_wishlist', 'view_promotion', 'select_promotion', 'view_cart', 'begin_checkout', 'add_shipping_info', 'add_payment_info', 'purchase', 'refund'];

if(ga4Events.indexOf(event) >= 0){
let prods = ecommerce.items;
let GoogleAdsArray = prods.map(function(prod) {
    if (!(prod.quantity)){
      prod.quantity = 1;
    }
    if(prod.hasOwnProperty('item_id') && prod.hasOwnProperty('price'))
      return {
        id: prod.item_id.toString(),
        google_business_vertical:'custom'
      };
  });

return GoogleAdsArray;
} else{
  return {};
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "ecommerce.*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 4/17/2023, 2:34:11 PM


