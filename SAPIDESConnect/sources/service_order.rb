require 'rubygems'
require 'savon'
require 'hashie'
require 'json'

class ServiceOrder < SourceAdapter
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

    requestString =
    "
         <IvPlant>1000</IvPlant>
         <IvWorkCntr>Mechanik</IvWorkCntr>
         <!--Optional:-->
         <OrderList>
            <!--Zero or more repetitions:-->
            <item>
               <Orderid></Orderid>
               <OrderType></OrderType>
               <Planplant></Planplant>
               <BusArea></BusArea>
               <MnWkCtr></MnWkCtr>
               <Plant></Plant>
               <MnWkctrId></MnWkctrId>
               <Pmacttype></Pmacttype>
               <Plangroup></Plangroup>
               <Systcond></Systcond>
               <FunctLoc></FunctLoc>
               <FunclocDisp></FunclocDisp>
               <FunclocDesc></FunclocDesc>
               <FunclocCreate></FunclocCreate>
               <Equipment></Equipment>
               <EquipmentDesc></EquipmentDesc>
               <EquipmentCreate></EquipmentCreate>
               <Serialno></Serialno>
               <Material></Material>
               <MatlDesc></MatlDesc>
               <Assembly></Assembly>
               <AssemblyDesc></AssemblyDesc>
               <Devicedata></Devicedata>
               <Maintplant></Maintplant>
               <Location></Location>
               <Maintroom></Maintroom>
               <Plsectn></Plsectn>
               <LocWkCtr></LocWkCtr>
               <LocWkctrId></LocWkctrId>
               <Abcindic></Abcindic>
               <Sortfield></Sortfield>
               <CompCode></CompCode>
               <ProfitCtr></ProfitCtr>
               <CoArea></CoArea>
               <Respcctr></Respcctr>
               <FuncArea></FuncArea>
               <SuperiorNetwork></SuperiorNetwork>
               <SuperiorActivity></SuperiorActivity>
               <SuperiorRoutingNo></SuperiorRoutingNo>
               <SuperiorCounter></SuperiorCounter>
               <WbsElem></WbsElem>
               <ProjDef></ProjDef>
               <ProcessingGroup></ProcessingGroup>
               <Objectclass></Objectclass>
               <Taxjurcode></Taxjurcode>
               <LocCompCode></LocCompCode>
               <LocCoArea></LocCoArea>
               <AssetNo></AssetNo>
               <SubNumber></SubNumber>
               <LocBusArea></LocBusArea>
               <Costcenter></Costcenter>
               <LocWbsElem></LocWbsElem>
               <Standorder></Standorder>
               <Settlorder></Settlorder>
               <Salesorg></Salesorg>
               <DistrChan></DistrChan>
               <Division></Division>
               <Ordplanid></Ordplanid>
               <StartDate></StartDate>
               <FinishDate></FinishDate>
               <Basicstart></Basicstart>
               <BasicFin></BasicFin>
               <Priority></Priority>
               <Revision></Revision>
               <Version></Version>
               <SchedType></SchedType>
               <Autosched></Autosched>
               <CapReqmts></CapReqmts>
               <SchedulingExactBreakTimes></SchedulingExactBreakTimes>
               <MrpRelevant></MrpRelevant>
               <ProductionStartDate></ProductionStartDate>
               <ProductionFinishDate></ProductionFinishDate>
               <ProductionStartTime></ProductionStartTime>
               <ProductionFinishTime></ProductionFinishTime>
               <ActualStartDate></ActualStartDate>
               <ActualFinishDate></ActualFinishDate>
               <ActualStartTime></ActualStartTime>
               <ActualFinishTime></ActualFinishTime>
               <Refdate></Refdate>
               <SalesOrd></SalesOrd>
               <SOrdItem></SOrdItem>
               <CalcMotive></CalcMotive>
               <InvestProfile></InvestProfile>
               <Scale></Scale>
               <InvReason></InvReason>
               <EnvirInvest></EnvirInvest>
               <EstimatedCosts></EstimatedCosts>
               <Currency></Currency>
               <CurrencyIso></CurrencyIso>
               <CstgSheet></CstgSheet>
               <OverheadKey></OverheadKey>
               <ResAnalKey></ResAnalKey>
               <NetworkProfile></NetworkProfile>
               <Cstgvappln></Cstgvappln>
               <Cstgvaract></Cstgvaract>
               <TaskListGroup></TaskListGroup>
               <GroupCounter></GroupCounter>
               <TaskListType></TaskListType>
               <RespPlannerGroup></RespPlannerGroup>
               <Mntplan></Mntplan>
               <Maintitem></Maintitem>
               <CallNo></CallNo>
               <LastOrd></LastOrd>
               <EnteredBy></EnteredBy>
               <EnterDate></EnterDate>
               <ChangedBy></ChangedBy>
               <ChangeDate></ChangeDate>
               <Scenario></Scenario>
               <SysStatus></SysStatus>
               <UserSt></UserSt>
               <Userstatus></Userstatus>
               <StatProf></StatProf>
               <ObjectNo></ObjectNo>
               <RoutingNo></RoutingNo>
               <ReservNo></ReservNo>
               <ShortText></ShortText>
               <LongText></LongText>
               <NotifNo></NotifNo>
               <NotifNo2></NotifNo2>
               <Name1></Name1>
               <PostCode1></PostCode1>
               <City1></City1>
               <Street></Street>
               <EquipmentDisplay></EquipmentDisplay>
               <OrderPushed></OrderPushed>
            </item>
         </OrderList>
         <!--Optional:-->
         <Return>
            <!--Zero or more repetitions:-->
            <item>
               <Type></Type>
               <Id></Id>
               <Number></Number>
               <Message></Message>
               <LogNo></LogNo>
               <LogMsgNo></LogMsgNo>
               <MessageV1></MessageV1>
               <MessageV2></MessageV2>
               <MessageV3></MessageV3>
               <MessageV4></MessageV4>
               <Parameter></Parameter>
               <Row></Row>
               <Field></Field>
               <System></System>
            </item>
         </Return>
    "

    response = client.request(
    "urn",
    "ZMtcOrderGetlist") {soap.body = requestString}

    mash = Hashie::Mash.new(response.to_hash())
    @result = {}
    orderArray = mash.z_mtc_order_getlist_response.order_list.item
    orderArray.each { |item|
        unless item.orderid.nil?  or  !item.mn_wk_ctr.include("CSC_P")
            entry = {}
            entry["short_text"] = item.short_text
            entry["order_id"] = item.orderid
            entry["loc_wk_ctr"] = item.loc_wk_ctr
            @result[entry["order_id"]] = entry
            p entry    
        end
    }
  end
 
  def sync
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