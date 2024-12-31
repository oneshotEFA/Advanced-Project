<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List Your Property</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link rel="stylesheet" href="Sell.css">
</head>
<body>
<%
    if(session.getAttribute("isAdmin")!=null){
%>
<header class="header">
    <div class="barr" onclick="togle()">
        <p>&#9776;</p>
    </div>
    <p>List property to the Web</p>
</header>
<div class="togg" id="togg">
    <a href="redirect">Dashboard</a>
    <a href="#about">Objective</a>
    <a href="manage">Setting</a>
    <a href="Login_handle">Logout</a>
</div>
<%
}
else{
%>
<header class="header">
    <div class="barr" onclick="togle()">
        <p>&#9776;</p>
    </div>
    <p>Transform your property listing into opportunities</p>
</header>
<div class="togg" id="togg">
    <a href="index.jsp">Home</a>
    <a href="index.jsp">Services</a>
    <a href="#about">About Us</a>
    <a href="#about">Contact Us</a>
</div>
<%
    }
%>
<main class="form-container">
    <div class="form-content">
        <%
            if (session != null && session.getAttribute("isAdmin") != null) {
        %>
        <form method="post" action="add" enctype="multipart/form-data">
                <%
                } else {
            %>
            <form method="post" action="accept" enctype="multipart/form-data">
                <%
                    }
                %>
                <div class="form-grid">
                    <div class="input-group">
                        <label for="price">Price ($)</label>
                        <input class="input-field" id="price" type="text" name="price" placeholder="Enter price" required>
                    </div>

                    <div class="input-group">
                        <label for="size">Size (sq ft)</label>
                        <input class="input-field" id="size" type="text" name="size" placeholder="Property size" required>
                    </div>

                    <div class="input-group">
                        <label for="bed">Bedrooms</label>
                        <input class="input-field" id="bed" type="text" name="bed" placeholder="Number of bedrooms" required>
                    </div>

                    <div class="input-group">
                        <label for="bath">Bathrooms</label>
                        <input class="input-field" id="bath" type="text" name="bath" placeholder="Number of bathrooms" required>
                    </div>
                </div>

                <div class="input-group">
                    <label for="address">Property Address</label>
                    <input class="input-field" id="address" type="text" name="address" placeholder="Full property address" required>
                </div>

                <div class="input-group">
                    <label>Property Status</label>
                    <div class="radio-group">
                        <div class="radio-option">
                            <input type="radio" id="forSale" name="status" value="For Sell" required>
                            <label for="forSale">For Sale</label>
                        </div>
                        <div class="radio-option">
                            <input type="radio" id="forRent" name="status" value="For Rent">
                            <label for="forRent">For Rent</label>
                        </div>
                    </div>
                </div>

                <div class="input-group">
                    <label for="description">Property Description</label>
                    <textarea class="input-field" id="description" name="disc" rows="4"
                              placeholder="Describe key features and amenities"></textarea>
                </div>

                <div class="input-group">
                    <label>Property Images</label>
                    <div class="file-upload">
                        <div class="file-input">
                            <input type="file" accept="image/*" name="img1">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                        <div class="file-input">
                            <input type="file" accept="image/*" name="img2">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                        <div class="file-input">
                            <input type="file" accept="image/*" name="img3">
                            <i class="fas fa-cloud-upload-alt"></i>
                        </div>
                    </div>
                </div>

                <button type="submit" class="submit-btn">List Property</button>
            </form>
    </div>
</main>
<div id="errorMessage" class="error">
    <%
        if (request.getAttribute("info")!=null){
    %>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p style="color: #4cae4c"><%=request.getAttribute("info")%></p>
        </div>
    </div>
    <%}%>
</div>
<div id="errorMessage" class="error">
    <%
        if (request.getAttribute("msg")!=null){
    %>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p style="color: #4cae4c"><%=request.getAttribute("msg")%></p>
        </div>
    </div>
    <%}%>
</div>
<footer class="footer" id="about">
    <div class="footer-container">

        <div class="footer-section">
            <h3>About Us</h3>
            <p>
                We provide a seamless way to search for properties that suit your needs.
                Discover your dream home or investment property with us.
            </p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#properties">Properties</a></li>
                <li><a href="#services">Services</a></li>
                <li><a href="#contact">Contact</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <p><strong>Email:</strong> info@propertyfinder.com</p>
            <p><strong>Phone:</strong> +251 985 094 082</p>
            <p><strong>Address:</strong> 123 Main Street, New York, NY</p>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/facebook--v1.png" alt="Facebook"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/twitter--v1.png" alt="Twitter"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/instagram-new.png" alt="Instagram"></a>
                <a href="#"><img src="https://img.icons8.com/material-outlined/24/ffffff/linkedin.png" alt="LinkedIn"></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Effortless Property. All Rights Reserved.</p>
    </div>
</footer>
<script>
    function togle() {
        var m = document.getElementById("togg");
        m.style.width = m.style.width === "150px" ? "0" : "150px";
    }
    var modal = document.getElementById("myModal");
    if (modal) {
        modal.style.display = "block";
    }
    function closeModal() {
        modal.style.display = "none";

    }
    window.onclick = function(event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>
</body>
</html>