## Blocmetrics 

An analytics service and reporting tool that you can use with web apps to track user activity and report results.

1) Create an account at [Blocmetrics](http://blocmetrics-austin.herokuapp.com) and add your website url you want to track.

Now, suppose we wanted to track page visits.

2) Add the following code to your site (either a new .js file or in `<script>` tags:

```
var blocmetrics = function() {
	var _bm_event = {
	event_name: "page visit",
	}

	var _bm_request = new XMLHttpRequest();
	_bm_request.open("POST", "http://blocmetrics-austin.herokuapp.com/api/events", true);
	_bm_request.setRequestHeader('Content-Type', 'application/json');
	_bm_request.onreadystatechange = function() {
	};
	_bm_request.send(JSON.stringify(_bm_event));
};

$(document).ready(function(){
    blocmetrics(window.location.origin);
  })
```

3) Visit your Blocmetrics Application page to see the live results!