<%@page import = "system.model.*" %>
<%
User user = (User) request.getSession().getAttribute("userobj");
Vehicle vehicle = (Vehicle) request.getSession().getAttribute("vehicleInForm");
Reservation reservation = (Reservation) request.getSession().getAttribute("reservation");
System.out.println(reservation.toString());
System.out.println(user.toString());
System.out.println(vehicle.toString());
%>
<!DOCTYPE html>
<html lang="en">
<style>
	<%@include file="confirm-booking.css"%>
</style>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="confirm-booking.css">
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
                                <span class="notification_number">2</span>
                            </div>
                        </a>
                    </li>
                    <li><a href="#"><i class='bx bx-user-circle profile_icon' onclick="toggleMenu()"></i></a></li>
                </div>
            </ul>

            <!-- notification bell -->
            <div class="notification_menu" id="notificationMenu">
                <div class="notification_word">
                    <h2>Notification</h2>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Accept Vehicle</h4>
                            <p>New Update on Booking: <span>Passat [ALK8704]</span></p>
                        </div>
                    </a>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Return Vehicle</h4>
                            <p>New Update on Booking: <span>Passat [ALK8704]</span></p>
                        </div>
                    </a>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Refund Request</h4>
                            <p>New Update on Booking: <span>Myvi [PKL2019]</span></p>
                        </div>
                    </a>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Accept Vehicle</h4>
                            <p>New Update on Booking: <span>Passat [ALK8704]</span></p>
                        </div>
                    </a>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Return Vehicle</h4>
                            <p>New Update on Booking: <span>Arteon [BGU2264]</span></p>
                        </div>
                    </a>
                </div>
                <div class="notification_item">
                    <a href="">
                        <div class="notification_row">
                            <h4>Refund Request</h4>
                            <p>New Update on Booking: <span>Myvi [PKL2019]</span></p>
                        </div>
                    </a>
                </div>
            </div>

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
    <section class="confirmation_form">
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
        <div class="confirm_title">
            <p>Booking Confirmation</p>
        </div>
        <div class="confirm_word">
            <h4>You are nearly there! Please confirm your booking to proceed.</h4>
        </div>
        <div class="confirmation">
            <div class="booking_confirmation">
                
                <div class="input_row">
                    <div class="input_form">
                        <span class="form_indicator"><h4>Renter Name</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=user.getUser_first_name()%> <%=user.getUser_last_name()%>" readonly>
                        </div>
                    </div>
                    <div class="input_form">
                        <span class="form_indicator"><h4>Renter Email</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=user.getUser_email()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="input_row">
                    <div class="input_form">
                        <span class="form_indicator"><h4>Vehicle Brand</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=vehicle.getV_brand()%>" readonly>
                        </div>
                    </div>
                    <div class="input_form">
                        <span class="form_indicator"><h4>Vehicle Model</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=vehicle.getV_model()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="input_row">
                    <div class="input_form">
                        <span class="form_indicator"><h4>Pickup Location</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getPickup_location()%>" readonly>
                        </div>
                    </div>
                    <div class="input_form">
                        <span class="form_indicator"><h4>Pickup Date</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getPickup_DateString()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="input_row">
                    <div class="input_form">
                        <span class="form_indicator"><h4>Drop Location</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getDrop_location()%>" readonly>
                        </div>
                    </div>
                    <div class="input_form">
                        <span class="form_indicator"><h4>Drop Date</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getDrop_DateString()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="input_row">
                    <div class="input_form">
                        <span class="form_indicator"><h4>Period of Rent (Days)</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getDay_count()%>" readonly>
                        </div>
                    </div>
                    <div class="input_form">
                        <span class="form_indicator"><h4>Number of Passenger</h4></span>
                        <div class="input_form">
                            <input type="text" placeholder="<%=reservation.getPassengers_num()%>" readonly>
                        </div>
                    </div>
                </div>
                <div class="form_row">
                    <div class="form_box">
                        <span class="form_indicator"><h4>Special Request</h4></span>
                        <div class="input_form">
                            <textarea class="special_request" name="special_request" placeholder="<%=reservation.getSpecial_req()%>" readonly></textarea>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="input_price">
                    <div class="input_total">
                        <span class="total_indicator"><h4>Total Charge (RM <%=reservation.getRent_to_pay() %>)</h4></span>
                        <h4 class="total_charge">RM 12.00 (incl. tax)</h4>
                    </div>
                    <div class="confirm_button">
                    	<form method="post" action="ConfirmBookingController">
                        	<button class="pay_button">Pay With Wallet</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="second">

    </section>
    <footer class="footer">
        <div class="foot_container">
            <div class="top">
                <div class="logo_details">
                    <img src="https://drive.google.com/uc?export=view&id=18npiizAlNUhQntPiwwuecc2WhbGA3JTv" alt="">
                </div>
                <div class="company_register">
                    <p>Owned by SEWA MALAYSIA SDN. BHD.</p>
                </div>
                <div class="media_details">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-telegram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>
    </footer>

    <script src="confirm-booking.js"></script>
</body>
</html>