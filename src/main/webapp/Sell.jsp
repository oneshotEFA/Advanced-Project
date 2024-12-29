<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>List Your Property</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<<<<<<< HEAD
      background-color: #f59e0c;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    header h2 {
      margin: 0;
      font-size: 24px;
    }
    .the-form {
      margin: 30px auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .formm {
      background-color: #ffffff;
      width: 60%;
      padding: 20px 40px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .card {
      margin-bottom: 20px;
      display: flex;
      flex-direction: column;
    }
    .card label {
      font-size: 14px;
      margin-bottom: 8px;
      font-weight: bold;
    }
    input[type="text"], input[type="file"] {
      height: 40px;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
      width: 100%;
      box-sizing: border-box;
    }
    .card input[type="radio"] {
      margin-right: 8px;
    }
    textarea {
      width: 100%;
      height: 100px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }
    button {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 12px 20px;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
    }
    button:hover {
      background-color: #0056b3;
    }
    .form-title {
      text-align: center;
      margin-bottom: 20px;
      font-size: 18px;
      font-weight: bold;
    }
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgb(0,0,0);
      background-color: rgba(0,0,0,0.4);
      padding-top: 60px;
      border-radius: 8px;
    }
    .modal-content {
      background-color: #fefefe;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 500px;
      border-radius: 5px;
    }
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
  </style>
=======
  <link rel="stylesheet" href="Sell.css">
>>>>>>> 310779eed2be0bd88f2d66b86bfa004975667245
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

<<<<<<< HEAD
      <div class="card">
        <label for="size">Size (sq ft)</label>
        <input id="size" type="text" name="size" placeholder="Enter size in square feet" required>
      </div>
      <div class="card">
        <label for="bed">Bedrooms</label>
        <input id="bed" type="text" name="bed" placeholder="Number of bedrooms" required>
      </div>
      <div class="card">
        <label for="bath">Bathrooms</label>
        <input id="bath" type="text" name="bath" placeholder="Number of bathrooms" required>
      </div>
      <div class="card">
        <label>Status</label>
        <input type="radio" name="status" value="For Sell" required> For Sell
        <input type="radio" name="status" value="For Rent"> For Rent
      </div>
      <div class="card">
        <label for="description">Description</label>
        <textarea id="description" name="disc" placeholder="Provide a brief description of the property"></textarea>
      </div>
      <div class="card">
        <label>Upload Images</label>
        <input type="file" accept="image/*" name="img1">
        <input type="file" accept="image/*" name="img2">
        <input type="file" accept="image/*" name="img3">
      </div>
      <div class="card">
        <button type="submit">Submit</button>
      </div>
    </form>
      <%
          if(request.getAttribute("info")!=null){
      %>
        <div id="myModal" class="modal">
          <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <p style="color: #4cae4c"><%=request.getAttribute("info")%></p>
          </div>
        </div>
      <%
          }
      %>
  </div>
</div>
<script>
  var modal = document.getElementById("myModal");

  // Automatically display the modal if it exists
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
=======
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
>>>>>>> 310779eed2be0bd88f2d66b86bfa004975667245
</body>
</html>