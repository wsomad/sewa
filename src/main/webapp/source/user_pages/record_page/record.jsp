<%@page import="system.model.*, java.text.SimpleDateFormat, java.util.List, java.time.LocalDate, java.util.Date, java.time.LocalDateTime, java.time.temporal.ChronoUnit" %>
<%
List<Activity> activities = (List<Activity>) session.getAttribute("listOfActivity");
%>
<!-- hh -->
<!DOCTYPE html>
<html lang="en">
<style>
	<%@include file="record.css"%>
</style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="record.css">
    <link rel="icon" type="images/png" href="https://drive.google.com/uc?export=view&id=1WnCOPug2C25vqv-_nxG6QvVp2VSMVnp1">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <title>SEWA | Car Rental Malaysia</title>
</head>
<body>
    <header class="header">
        <nav class="nav">
            <a href="../dashboard_page/user-dashboard.html" ><img src="https://drive.google.com/uc?export=view&id=1hnKz5R1P7uMvl4c2qAnSFUHrdH4Sy41B" class="nav_logo"></a>
            <ul class="nav_items">
                <li><a href="../dashboard_page/user-dashboard.html" class="nav_link">Home</a></li>
                <li>
                    <a href="" class="nav_link" id="service-link">Service</a>
                    <ul class="sub_nav_link" id="service-dropdown"> 
                        <li><a href="">Car Rental</a></li>
                        <li><a href="../p2p_page/p2p-register.html">Rent as Peer</a></li>
                    </ul>
                </li>
                <li><a href="car.html" class="nav_link">Our Cars</a></li>
            </ul>         
            <ul>
                <div class="wallet_profile">
                    <li><a href="#"><i class='bx bx-wallet-alt wallet_show'></i></a></li>
                    <li><a href="#">
                            <div class="notification_badge">
                                <i class="fa fa-bell notification_bell" onclick="toggleNotification()"></i>
                                <span class="notification_number"></span>
                            </div>
                        </a>
                    </li>
                    <li><a href="#"><i class='bx bx-user-circle profile_icon' onclick="toggleMenu()"></i></a></li>
                </div>
            </ul>


            <!-- sub menu -->
            <div class="sub-menu-wrap" id="subMenu">
                <div class="sub-menu">
                    <div class="user-info">
                         <h2>Hello user</h2>
                    </div>
                    <a href="a" class="sub-menu-link">
                        <i class='bx bx-user-circle'></i>
                            <p>Profile</p>
                    </a>
                    <a href="a" class="sub-menu-link">
                        <i class='bx bx-cog'></i>
                            <p>Setting</p>
                    </a>
                    <a href="a" class="sub-menu-link">
                        <i class='bx bx-log-out' ></i>
                            <p>Sign out</p>
                    </a>
                    <div class="owner_name">
                        <p class="owner">Owned by SEWA Malaysia SDN. BHD.</p>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <section class="home">
        <div class="wallet_container" id="walletMenu">
            <i class="fa fa-times form_close"></i>
            <div class="topup">
                <div class="wallet_title">
                    <h2>Wallet Topup <span>(min. RM10)</span></h2>
                </div>
                <div class="input_form">
                    <input type="email" placeholder="Enter Amount" required>
                    <i class="fa fa-plus topup_wallet"></i>
                </div>
                <div class="current_balance">
                    <p>Current Balance | RM 50.00</p>
                </div>
                <div class="amount_container">
                    <div class="select_amount">
                        <div class="amount">
                            <button>RM 10</button>
                        </div>
                        <div class="amount">
                            <button>RM 20</button>
                        </div>
                        <div class="amount">
                            <button>RM 50</button>
                        </div>
                    </div>
                    <div class="select_amount">
                        <div class="amount">
                            <button>RM 100</button>
                        </div>
                        <div class="amount">
                            <button>RM 200</button>
                        </div>
                        <div class="amount">
                            <button>RM 500</button>
                        </div>
                    </div>
                </div>
                <p class="owner">Owned by SEWA Malaysia SDN. BHD.</p>
            </div>
        </div>
    </section>

    <section class="home2">
        <div class="activity">
            <p>Record & Activities</p>
            <div class="activity_container">
            
<!-- ===================================================================================================================== -->
            <!--1. If Statement (within this week) -->
            <%
            int indexTracker = 0;
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            LocalDate currentDate = LocalDate.now();
            Date current = new Date();
            LocalDate range1StartDate = currentDate.minusDays(7);
            
            if(current.after(activities.get(0).getReservation().getPickup_date()) && current.before(activities.get(0).getReservation().getDrop_date())){
            %>
            	<div class="date_bar">
                    <p>In Used</p>
                    <div class="horizontal_line"></div>
                </div>
	              <div class="booking_container">
	                  <div class="car_image">
	                  	<%String imgPath = "../carPic/" + activities.get(0).getReservation().getReservation_vehicleid() + ".jpg"; %>
	                      <img src= <%=imgPath%>>
	                  </div>
	                  <div class="booked_car">
	                      <div class="car_info">
	                          <div class="info_details">
	                              <div class="details">
	                                  <h4>Brand</h4>
	                                  <p><%=activities.get(0).getVehicle().getV_brand()%></p>
	                              </div>
	                              <div class="details">
	                                  <h4>Start Date</h4>
	                                  <p><%=activities.get(0).getReservation().getPickup_DateString()%></p>
	                              </div>
	                          </div>
	                          <div class="info_details">
	                              <div class="details">
	                                  <h4>Model</h4>
	                                  <p><%=activities.get(0).getVehicle().getV_model()%></p>
	                              </div>
	                              <div class="details">
	                                  <h4>Return Date</h4>
	                                  <p><%=activities.get(0).getReservation().getDrop_DateString()%></p>
	                              </div> 
	                          </div>
	                          <div class="info_details">
	                              <div class="details">
	                                  <h4>Reg. Number</h4>
	                                  <p><%=activities.get(0).getVehicle().getRegistration_num()%></p>
	                              </div>
	                              <div class="details">
	                                  <h4>Pickup Place</h4>
	                                  <p><%=activities.get(0).getReservation().getPickup_location() %></p>
	                              </div>
	                          </div>
	                          <div class="info_details">
	                              <div class="details">
	                                  <h4>Rental Fee</h4>
	                                  <p>RM <%=activities.get(0).getReservation().getRent_to_pay() %></p>
	                              </div>
	                              <div class="details">
	                                  <h4>Drop Place</h4>
	                                  <p><%=activities.get(0).getReservation().getDrop_location()%></p>
	                              </div>
	                          </div>
	                      </div>
	                  </div>
	              </div>
            <%
            indexTracker++;
            }
            
            LocalDateTime timestamp = activities.get(indexTracker).getReservation().getInsertionTimestamp().toLocalDateTime();
            System.out.println(timestamp);
            
            if (timestamp.toLocalDate().isAfter(range1StartDate) ) {
            	System.out.println("Recent---");
            %>
                <div class="date_bar">
                    <p>Recent</p>
                    <div class="horizontal_line"></div>
                </div>
                <!--2. for statement (recent activities) -->
                <%for (int i=indexTracker; i<activities.size(); i++) {
                	timestamp = activities.get(i).getReservation().getInsertionTimestamp().toLocalDateTime();
                	//3. if statement
                	if(timestamp.toLocalDate().isAfter(range1StartDate)){
                		System.out.println(activities.get(i).getReservation().getInsertionTimestamp());
                %>
		                <div class="booking_container">
		                    <div class="car_image">
		                    	<%String imgPath = "../carPic/" + activities.get(i).getReservation().getReservation_vehicleid() + ".jpg"; %>
		                        <img src= <%=imgPath%>>
		                    </div>
		                    <div class="booked_car">
		                        <div class="car_info">
		                            <div class="info_details">
		                                <div class="details">
		                                    <h4>Brand</h4>
		                                    <p><%=activities.get(i).getVehicle().getV_brand()%></p>
		                                </div>
		                                <div class="details">
		                                    <h4>Start Date</h4>
		                                    <p><%=activities.get(i).getReservation().getPickup_DateString()%></p>
		                                </div>
		                            </div>
		                            <div class="info_details">
		                                <div class="details">
		                                    <h4>Model</h4>
		                                    <p><%=activities.get(i).getVehicle().getV_model()%></p>
		                                </div>
		                                <div class="details">
		                                    <h4>Return Date</h4>
		                                    <p><%=activities.get(i).getReservation().getDrop_DateString()%></p>
		                                </div> 
		                            </div>
		                            <div class="info_details">
		                                <div class="details">
		                                    <h4>Reg. Number</h4>
		                                    <p><%=activities.get(i).getVehicle().getRegistration_num()%></p>
		                                </div>
		                                <div class="details">
		                                    <h4>Pickup Place</h4>
		                                    <p><%=activities.get(i).getReservation().getPickup_location() %></p>
		                                </div>
		                            </div>
		                            <div class="info_details">
		                                <div class="details">
		                                    <h4>Rental Fee</h4>
		                                    <p>RM <%=activities.get(i).getReservation().getRent_to_pay() %></p>
		                                </div>
		                                <div class="details">
		                                    <h4>Drop Place</h4>
		                                    <p><%=activities.get(i).getReservation().getDrop_location()%></p>
		                                </div>
		                            </div>
		                        </div>
		                        	<%if(activities.get(i).getUserStatus().equals("Tenant")){
		                        		int vehicleid = activities.get(i).getReservation().getReservation_vehicleid();
		                        		System.out.println("isitnull ? : " + vehicleid);
		                        		Reservation existReserve = activities.get(i).getReservation();
		                        	%>	
				                        <div class="activity_button">
					                        	<form method="post" action="BookingController"> 
					                        		<input type="hidden" name="vehicleId" value="<%=vehicleid%>">
					                            	<button>Reschedule</button>
					                            </form>
					                    </div>
					                    <div class="activity_button">
					                        	<form method="post" action="CancellationController">
					                        		<input type="hidden" name="vehicleid" value="<%=vehicleid%>">
				                            		<button>Cancel</button>
				                            	</form>
				                        </div>
		                           	<%}//else{ %>
		                            <%//} %>
		                    </div>
		                </div>
	            <%	
	            	}else{break;}
                	//3. if statement (close)
	            } %>
                <!--2. for statement -->
            <%} %>
            <!--1. close if statement -->

            </div>
        </div>
    </section>

    <script src="record.js"></script>
</body>
</html>