<nav class="navbar navbar-expand-lg navbar-light bg-green"> <!-- Update the background color to green -->
    <div class="container">
        <a class="navbar-brand " href="Index.jsp">Green SuperMarket </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link nav-link-green" href="Hompage.jsp">Home</a> <!-- Update the text color to green -->
                </li>
                <li class="nav-item"><a class="nav-link nav-link-green" href="Cart.jsp"> Cart<span class="badge badge-danger px-1">${cart_list.size()}</span></a></li>
                <% if(auth != null) { %>
                    <li class="nav-item"><a class="nav-link nav-link-green" href="Orders.jsp">Orders</a></li>
                    <li class="nav-item"><a class="nav-link nav-link-green" href="log-out">Logout</a></li>
                <% } else { %>
                    <li class="nav-item"><a class="nav-link nav-link-green" href="Login.jsp">Login</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<style>
    .bg-green {
        background-color: #4CAF50; /* Replace with your desired shade of green */
    }

    .navbar-brand {
        color: white; /* Replace with your desired shade of green for the brand text */
    }

    .nav-link-green {
        color: white !important; /* Replace with your desired shade of green for the nav links */
    }

    /* Optional: Add some padding to the badge for better visibility */
    .badge-danger {
        padding: 0.25rem 0.5rem;
    }
</style>
