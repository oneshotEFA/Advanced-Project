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
<header class="header">
  <p>Transform your property listing into opportunities</p>
</header>

<main class="form-container">
  <div class="form-content">
    <%
      if (session != null && session.getAttribute("header") != null) {
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
</body>
</html>