<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="js/daum.js"></script>
<script type="text/javascript" src="js/jquery-3.1.0.js"></script>
<script>
  function sameAddress(n){
	  console.log(n, n.checked);
	  if(n.checked){
		  var mname = document.querySelector("#mname").value;
		  document.querySelector("#orderName").value = mname;
		  var mpost = document.querySelector("#mpost").value;
		  document.querySelector("#post1").value = mpost;
		  
		  var maddress1 = document.querySelector("#maddress1").value;
		  document.querySelector("#addr1").value = maddress1;
		  var maddress2 = document.querySelector("#maddress2").value;
		  document.querySelector("#addr2").value = maddress2;
		  
		  var mphone = document.querySelector("#mphone").value;
		  document.querySelector("#phone").value = mphone;
	  }else{
		  document.querySelector("#orderName").value = "";
		  document.querySelector("#post1").value = "";
		  document.querySelector("#addr1").value = "";
		  document.querySelector("#addr2").value = "";
		  ocument.querySelector("#phone").value = "";
	  }
  }
  
  //<input type="button"> 은 자동 submit 안됨.
  function orderDone(f){
	  
	  f.action="GoodsOrderDoneServlet";
	  f.method="get";
	  f.submit();
  }
</script>	


<form name="myForm" method="get" action="GoodsOrderDoneServlet">
	<!-- 상품정보  -->
	<input type="hidden" name="gCode" value="${cDTO.gCode}">
	<input type="hidden" name=gName value="${cDTO.gName}">
	<input type="hidden" name="gPrice" value="${cDTO.gPrice}">
	<input type="hidden" name="gSize" value="${cDTO.gSize}">
	<input type="hidden" name="gColor" value="${cDTO.gColor}">
	<input type="hidden" name="gAmount" value="${cDTO.gAmount}">
	<input type="hidden" name="gImage" value="${cDTO.gImage}">
	<!-- Cart에서 삭제할 num 값 -->
	<input type="hidden" name="cartNum" value="${cDTO.num}">

	<!-- 상품정보  -->
	<table width="80%" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>주문상품 확인</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_default" align="center"><strong>주문번호</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
					</tr>

					<tr>
						<td colspan="4">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>

					<tr>
						<td class="td_default" width="80">${cDTO.num}</td>
						<td class="td_default" width="80">
							<img src="images/items/${cDTO.gImage}.gif" border="0" align="center" width="80" />
						</td>
						<td class="td_default" width="300" style='padding-left: 30px'>
							${cDTO.gName}<br> 
							<font size="2" color="#665b5f">
								[옵션 : 사이즈(${cDTO.gSize}), 색상(${cDTO.gColor})]
							</font>
						</td>
						<td class="td_default" align="center" width="110">
							${cDTO.gPrice}
						</td>
						<td class="td_default" align="center" width="90">
							${cDTO.gAmount}
						</td>
					</tr>

					<tr>
						<td height="30"></td>
						<td class="td_default" align="right">총 결제 금액 :</td>
						<td class="td_default" align="right">
							${cDTO.gPrice * cDTO.gAmount}
						</td>
					</tr>
				</table> 
			</td>
		</tr>
		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>
	
		<!--  고객 정보 시작-->
		<tr>
			<td height="30">
		</tr>

		<tr>
			<td><b>고객 정보</b></td>
		</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">		
							이 름
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="mname" size="20"
								value="${mDTO.username}" maxlength="20" />
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							우편번호
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="mpost" size="4"
								value="${mDTO.post}" maxlength="3" readonly="readonly" />
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							주 소
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="maddress1" size="35"
								value="${mDTO.addr1}" maxlength="200" readonly="readonly" /><br>
							<input class="input_default" type="text" id="maddress2" size="35"
								value="${mDTO.addr2}" maxlength="200" readonly="readonly" />
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							휴대전화4
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="mphone" size="15"
								value="${mDTO.phone1}-${mDTO.phone2}-${mDTO.phone3}" maxlength="15"></input>
						</td>
					</tr>
				</table>							
			</td>
		</tr>
		
	<!--  고객 정보 끝-->
		<tr>
			<td height="30">
		</tr>
	
		<tr> 
			<td class="td_default">
				<input type="checkbox" name="same" onclick="javascript:sameAddress(this);"> 
				배송지가 동일할 경우 선택하세요.
			</td>
		</tr>
		
	<!--  배송지 정보 시작-->
		<tr>
			<td height="30">
		</tr>
	
		<tr>
			<td><b>배송지 정보</b></td>
		</tr>
	
		<tr>
			<td height="15">
		</tr>
	
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							이 름
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="orderName"
								name="orderName" size="20" maxlength="20" value="" />
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							우편번호
						</td>
						<td height="35" class="td_default">
							<!-- 다음주소 시작-->
							<input name="post1" id="post1" size="5" readonly=""> 
							<input onclick="openDaumPostcode()" type="button" value="우편번호찾기">
							<br>
							<input name="addr1" id="addr1" size="40" readonly=""
								placeholder="도로명주소">
							<br>
							<span style="line-height: 10%;"><br></span>
							<input name="addr2" id="addr2" size="40" placeholder="지번주소">
							<!-- 다음주소 끝 -->
						</td>
					</tr>
					
					<tr>
						<td height="35" class="td_default">
							휴대전화
						</td>
						<td height="35" class="td_default">
							<input class="input_default" type="text" id="phone"
								name="phone" size="15" maxlength="15" value="" />
						</td>
					</tr>
				</table>							
			</td>
		</tr>
	<!--  배송지 정보 끝-->
	
		<tr>
			<td height="30">
		</tr>
		
		<tr>
			<td><b>결제수단</b></td>
		</tr>
	
		<tr>
			<td height="15">
		</tr>
		
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="0" border="1"
						style="border-collapse:collapse" bordercolor="#CCCCCC">
					<tr>
						<td width="125" height="35" class="td_default">
							<input type="radio" name="payMethod" value="신용카드" checked>신용카드</input>
							
							<input type="radio" name="payMethod" value="계좌이체">계좌이체</input>
							
							<input type="radio" name="payMethod" value="무통장 입금">무통장 입금</input>
						</td>
					</tr>
				</table>							
			</td>
		</tr>
		
		<tr>
			<td height="30">
		</tr>
	
		<tr>
			<td class="td_default" align="center">
				<input type='button' value='취소' onclick="javascript:history.back()">	
				<input type='button' value='결제하기' onclick="orderDone(myForm)">
				<input type="submit" value="결제하기2">
				<button>결제하기3</button>
			</td>
		</tr>
		
	</table>
</form>