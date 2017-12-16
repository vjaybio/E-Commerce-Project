<HTML>
<HEAD>
<TITLE>Confirm Order </TITLE>



<CFQUERY name="GetUserId" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select userid from shopper where userid = #url.userid#
</CFQUERY>
<CFQUERY name="GetPrice" DATASOURCE="UnivDB" DBTYPE="ODBC">
	select price, (price*0.05)*price as tax from product 
	where ProductId = #url.id#
 </CFQUERY>
   
</HEAD>
<BODY>


<HR>
<P>
<CFOUTPUT query="GetPrice">

<table nowrap cellspacing="4" cellpadding="4" border="0">
<FORM action="ordersuccess.cfm?id=#url.id#&userid=#url.userid#&price=#price#&tax=#tax#" method="post" >

<div>
	
		<h2 style="color:Tomato"> Confirm Order: </h2>

		    
			<legend>Shipping Address:</legend>

			<div>
				<label for="street">Number and Street</label>
				<br>
				<input id="street" name="street" type="text">
			</div>

			<div>
				<label for="city">City</label>
				<br>
				<input id="city" name="city" type="text">
			</div>


			<div>
				<label for="state">State</label> 
				<select id="state" name="state">
					<option value="AL">Alabama</option>
					<option value="AK">Alaska</option>
					<option value="AZ">Arizona</option>
					<option value="AR">Arkansas</option>
					<option value="CA">California</option>
					<option value="CO">Colorado</option>
					<option value="CT">Connecticut</option>
					<option value="DE">Delaware</option>
					<option value="DC">District Of Columbia</option>
					<option value="FL">Florida</option>
					<option value="GA">Georgia</option>
					<option value="HI">Hawaii</option>
					<option value="ID">Idaho</option>
					<option value="IL">Illinois</option>
					<option value="IN">Indiana</option>
					<option value="IA">Iowa</option>
					<option value="KS">Kansas</option>
					<option value="KY">Kentucky</option>
					<option value="LA">Louisiana</option>
					<option value="ME">Maine</option>
					<option value="MD">Maryland</option>
					<option value="MA">Massachusetts</option>
					<option value="MI">Michigan</option>
					<option value="MN">Minnesota</option>
					<option value="MS">Mississippi</option>
					<option value="MO">Missouri</option>
					<option value="MT">Montana</option>
					<option value="NE">Nebraska</option>
					<option value="NV">Nevada</option>
					<option value="NH">New Hampshire</option>
					<option value="NJ">New Jersey</option>
					<option value="NM">New Mexico</option>
					<option value="NY">New York</option>
					<option value="NC">North Carolina</option>
					<option value="ND">North Dakota</option>
					<option value="OH">Ohio</option>
					<option value="OK">Oklahoma</option>
					<option value="OR">Oregon</option>
					<option value="PA">Pennsylvania</option>
					<option value="RI">Rhode Island</option>
					<option value="SC">South Carolina</option>
					<option value="SD">South Dakota</option>
					<option value="TN">Tennessee</option>
					<option value="TX">Texas</option>
					<option value="UT">Utah</option>
					<option value="VT">Vermont</option>
					<option value="VA">Virginia</option>
					<option value="WA">Washington</option>
					<option value="WV">West Virginia</option>
					<option value="WI">Wisconsin</option>
					<option value="WY">Wyoming</option>
				</select>
			</div>

			<div>
				<label for="ZipCode">Zip Code</label>
				<input id="ZipCode" name ="ZipCode" type="text">
			</div>
		<br>
		
		<br>
			<legend>Shipping Contact:</legend>
			
			<div>
				<input id="pphone" name="pphone" type="tel" placeholder="Primary Phone">
				
			</div>
			
			<br>
			
			<div>
				
				<input id="email" name="email" type="email" placeholder="email@example.com">
			</div>
			
		<br>
		
		<legend>Order Payment Method:<legend>
			
			<div>
				<label for="CardType"><small>Card Type<small</label> 
				<select id="CardType" name="CardType">
					<option value="VISA">VISA</option>
					<option value="MASTER">MASTER CARD</option>
					<option value="DISCOVER">DISCOVER</option>
					<option value="AMERICAN EXPRESS">AMERICAN EXPRESS</option>
				</select>
				
			</div>
			<div>
				<label for="CardName">Name On Card </label>
				<input id="CardName" name="CardName" type="text">
			</div>
			
			<div>
				<label for="CardNumber">Card Number</label>
				<input id="CardNumber" name="CardNumber" type="text" placeholder="Card Number">
				<input id="SecurityCode" name="SecurityCode" type="text" placeholder="Security Code">
				
			</div>
			<div>
				<label for="Expiry">Expiry</label>
				<select id="month" name="month">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				<select id="year" name="year">
					<option value="2017">2017</option>
					<option value="2018">2018</option>
					<option value="2019">2019</option>
					<option value="2020">2020</option>
					<option value="2021">2021</option>
					<option value="2022">2022</option>
					<option value="2023">2023</option>
					<option value="2024">2024</option>
					<option value="2025">2025</option>
					<option value="2026">2026</option>
					<option value="2027">2027</option>
					<option value="2028">2028</option>
				</select>
			</div>
		
		<br>
		<br>
		<input type="submit" value="Submit">
		<input type="reset" value="Reset">


<tr>
<br>
<br>

</tr>
</cfoutput>

</FORM>
</TABLE>
</BODY>
<a href="main_new.cfm"><img src="images/left_arrow.png"> <medium><em>Back to Main Menu</em></medium></a>
</HTML>

