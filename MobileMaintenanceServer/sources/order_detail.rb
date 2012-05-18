require 'rubygems'
require 'savon'
require 'hashie'
require 'json'


class OrderDetail < SourceAdapter
  def initialize(source) 
    super(source)
  end
 
  def login
    # TODO: Login to your data source here if necessary
  end
 
  def query(params=nil)
       client = Savon::Client.new do
       wsdl.document = "http://cscappwin087.at.emea.csc.com:8000/sap/bc/srt/wsdl/bndg_208D824FDE00F518E1000000142B8271/wsdl11/allinone/standard/document?sap-client=800"
       wsdl.endpoint = "http://cscappwin087.at.emea.csc.com:8000/sap/bc/srt/rfc/sap/z_mtc_order/800/z_mtc_order/z_mtc_order"
       http.auth.basic("estelzer", "emanuel2012")
     end
 
    requestString="<Orderid>000000817840</Orderid>"
 
    response = client.request(
        "urn",
        "ZMtcOrderGetlist") {soap.body = requestString}
 
 #    mash = Hashie::Mash.new(response.to_hash())
 #    @result = {} #ZMtcOrderGetdetailResponse
 #    orderArray = mash.z_mtc_order_getdetail_response.order_list.item
 #    orderArray.each { |item|
 #        unless item.orderid.nil?
 #          entry = {}
 #         entry["short_text"] = item.short_text
 #          entry["order_id"] = item.orderid
 #          entry["loc_wk_ctr"] = item.loc_wk_ctr
 #          @result[entry["order_id"]] = entry 
 #          p entry         
 #        end
 #    }
       @result = {}
       return result
   end
 
  def sync
    # Manipulate @result before it is saved, or save it 
    # yourself using the Rhoconnect::Store interface.
    # By default, super is called below which simply saves @result
    super
  end
 
  def create(create_hash)
    # TODO: Create a new record in your backend data source
    raise "Please provide some code to create a single record in the backend data source using the create_hash"
  end
 
  def update(update_hash)
    # TODO: Update an existing record in your backend data source
    raise "Please provide some code to update a single record in the backend data source using the update_hash"
  end
 
  def delete(delete_hash)
    # TODO: write some code here if applicable
    # be sure to have a hash key and value for "object"
    # for now, we'll say that its OK to not have a delete operation
    # raise "Please provide some code to delete a single object in the backend application using the object_id"
  end
 
  def logoff
    # TODO: Logout from the data source if necessary
  end
end