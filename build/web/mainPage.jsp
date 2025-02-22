<!DOCTYPE html>
<html lang="en">
   <head>
      <meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate, max-age=0">
      <meta http-equiv="Pragma" content="no-cache">
      <meta http-equiv="Expires" content="0">
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>WithYou.</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
      
      <style>
          /* Add these styles to your existing stylesheet or in a style tag */

.submit-button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.submit-button:hover {
    background-color: #45a049;
}

      </style>
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#"/></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header class="full_bg">
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="index.html">With You.</a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item">
                                 <a class="nav-link" href="#service">Service</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="#about">About</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="#contact">Contact Us</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="BookingStatus.jsp">Booking Status</a>
                              </li>
                              <li class="nav-item">
                                 <a class="nav-link" href="Logout">Logout</a>
                              </li>
                           </ul>
                        </div> 
                     </nav>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
         <!-- end header -->
         <!-- banner -->
         <section class="banner_main">
            <div id="myCarousel" class="carousel slide banner" data-ride="carousel">
               <ol class="carousel-indicators">
                  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#myCarousel" data-slide-to="1"></li>
                  <li data-target="#myCarousel" data-slide-to="2"></li>
               </ol>
               <div class="carousel-inner">
                  <div class="carousel-item active">
                     <div class="container">
                        <div class="carousel-caption  banner_po">
                           <div class="row">
                              <div class="col-lg-8 col-md-9 ">
                                 <div class="build_box">
                                    <h1>Wedding <span class="orang"> Couple</span></h1>
                                    <p>"Two Hearts, One Dream: Our Love Story, Your Perfect Day."</p>
                                    <a class="read_more quote_btn" href="form.jsp">Book Now</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="container">
                        <div class="carousel-caption banner_po">
                           <div class="row">
                              <div class="col-lg-8 col-md-9 ">
                                 <div class="build_box">
                                    <h1>Wedding <span class="orang"> Couple</span></h1>
                                    <p> "Love Forever Begins Today: Uniting Hearts, Creating Memories, Celebrating Always!"</p>
                                    <a class="read_more quote_btn" href="form.jsp">Book Now</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="carousel-item">
                     <div class="container">
                        <div class="carousel-caption banner_po">
                           <div class="row">
                              <div class="col-lg-8 col-md-9 ">
                                 <div class="build_box">
                                    <h1>Wedding <span class="orang"> Couple</span></h1>
                                    <p>"Eternal Love, Timeless Vows: Your Journey to Happily Ever After Starts Here!"</p>
                                    <a class="read_more quote_btn" href="form.jsp">Book Now</a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
               <i class="fa fa-angle-left" aria-hidden="true"></i>
               <span class="sr-only">Previous</span>
               </a>
               <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
               <i class="fa fa-angle-right" aria-hidden="true"></i>
               <span class="sr-only">Next</span>
               </a>
            </div>
         </section>
      </header>
      <!-- end banner -->
      <!-- play -->
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-8 offset-md-2 col-sm-8 offset-sm-2">
                  <div class="play_btn text_align_center">
                     <img src="images/play.png" alt="#"/>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end play -->
      <!-- our plane -->
      <div class="plane" id="service">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="titlepage">
                     <h2>Our Service</h2>
                     <span>"Seamless Celebrations, Effortless Elegance: Where Your Perfect Wedding Awaits, and Every Detail is a Promise Kept."</span>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="plan_bax text_align_center">
                     <figure><img src="images/plan_img.jpg" alt="#"/></figure>
                     <div  id="ho_plan" class="plan_text">
                        <h3>FLOWER DECORATIONS</h3>
                        <p>Transform your special moments into blooming masterpieces with our exquisite flower decoration services. Immerse your events in the language of flowers, where each petal tells a story of romance, elegance, and natural beauty.  </p>
                        <a class="read_more" href="Javascript:void(0)">Read More</a>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="plan_bax text_align_center">
                     <figure><img src="images/wedding.jpg" alt="#"/></figure>
                     <div  id="ho_plan" class="plan_text">
                        <h3>BEST VENUES</h3>
                        <p>Discover the perfect canvas for your cherished moments with our exceptional venue services. Immerse yourself in a space where dreams unfold and memories are made. Our meticulously curated venues blend elegance with functionality, providing a backdrop that adapts to your vision</p>
                        <a class="read_more" href="Javascript:void(0)">Read More</a>
                     </div>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="plan_bax text_align_center">
                     <figure><img src="images/food.jpg" alt="#"/></figure>
                     <div  id="ho_plan" class="plan_text">
                        <h3>FOOD CATERING</h3>
                        <p>Savor the extraordinary with our catering services that tantalize your taste buds and elevate your event to a culinary masterpiece. Immerse yourself in a world of flavors, where every dish is a symphony of freshness, creativity, and gastronomic delight</p>
                        <a class="read_more" href="Javascript:void(0)">Read More</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- our plane -->
      <!-- groomsmen -->
      <div class="groomsmen" id="planner">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="titlepage">
                     <h2>Our Wedding Planner</h2>
                     <span>Turning Dreams into Reality: Your Day, Our Expertise - Wedding Wonders Unveiled by Our Planners!</span>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-4">
                  <div class="brid text_align_center">
                     <figure><img src="images/planner1.jpg" alt="#"/></figure>
                     <h3> Mr. Sofiy Adam</h3>
                  </div>
               </div>
               <div class="col-md-4 margin_top70">
                  <div class="brid text_align_center">
                     <figure><img src="images/planner2.jpg" alt="#"/></figure>
                     <h3> Mr. Arif Asyraf </h3>
                  </div>
               </div>
               <div class="col-md-4">
                  <div class="brid text_align_center">
                     <figure><img src="images/planner3.jpg" alt="#"/></figure>
                     <h3> Mr. Tun Irfan </h3>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- groomsmen -->
      <!-- about -->
      <div class="about" id="about">
         <div class="container ">
            <div class="row d_flex">
               <div class="col-md-5">
                  <div class="titlepage">
                     <h2>About With You.</h2>
                     <span>As a premier wedding booking company, we specialize in turning your vision into an enchanting reality. Immerse yourself in a seamless journey of love and celebration as we meticulously curate every detail for your special day. From stunning venues and exquisite floral arrangements to delectable catering and expert coordination, we take pride in offering a comprehensive suite of services. Our dedicated team of wedding experts is committed to ensuring that your celebration is a unique reflection of your love story. </span>
                     
                  </div>
               </div>
               <div class="col-md-7">
                  <div class="about_img">
                     <figure><img src="images/love.jpg" alt="#"/></figure>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end about -->
    
      <!--  contact -->
      <div class="contact" id="contact">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <div class="ru_bg">
                     <div class="row">
                        <div class="col-md-3">
                          <a href="index.html"> <img class="logo_fooetr" src="images/With You..png" alt="#"/></a>
                        </div>
                        <div class="col-md-9">
                           <ul class="lacation">
                              <li><i class="fa fa-map-marker" aria-hidden="true"></i> Puncak 7 Residence </li>
                              <li><i class="fa fa-volume-control-phone" aria-hidden="true"></i> 012-3456789</li>
                              <li><i class="fa fa-envelope" aria-hidden="true"></i> GptHomies@gmail.com</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="row d_flex">
               <div class="col-md-6">
                  <div class="col-md-12">
                     <div class="titlepage">
                        <h2>Contact Us</h2>
                     </div>
                  </div>
                  <form id="request" class="main_form" method="post" action="Feedback">
                     <div class="row">
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Name" type="type" name="Name"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Phone number" type="type" name="Phone">                          
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Email" type="type" name="Email"> 
                        </div>
                        <div class="col-md-12">
                           <textarea class="textarea" placeholder="Message" name="Message"></textarea>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <input type="submit" value="Submit" class="submit-button">
                        </div>
                        <div class="col-md-6 col-sm-6">
                        
                        </div>
                     </div>
                  </form>
               </div>
               <div class="col-md-6">
                  <div class="map_main">
                     <div class="map-responsive">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.0748294386!2d101.49569267472998!3d3.0746886969010085!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31cc52f589a714f7%3A0xb1da67e3f74b4dd!2sPuncak%207%20Residences!5e0!3m2!1sen!2smy!4v1704485232029!5m2!1sen!2smy" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end contact -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-8 offset-md-2">
                  
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script>
        window.history.forward();

        function noBack() {
            window.history.forward();
        }
    </script>

   </body>
</html>