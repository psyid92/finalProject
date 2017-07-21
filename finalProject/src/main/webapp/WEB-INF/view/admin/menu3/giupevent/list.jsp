<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<link rel="Stylesheet" type="text/css"
	href="<%=cp%>/resource/jquery/css/croppie.css" />
<script src="<%=cp%>/resource/jquery/js/croppie.js"></script>
<script src="<%=cp%>/resource/jquery/js/exif.js"></script>



<li id="rotate"><strong class="focus">rotate(degrees)</strong><em></em>
	<p>
		Rotate the image by a specified degree amount. Only works with
		<code class="language-javascript">enableOrientation</code>
		option enabled (see 'Options').
	</p>
	<ul class="parameter-list">
		<li><code class="language-javascript">degrees</code> <span
			class="default">Valid Values:</span> <code>90, 180, 270, -90,
				-180, -270</code></li>
	</ul></li>

<script>
	$('.demo').croppie({
		viewport : {
			width : 150,
			height : 150,
			type : 'square'
		},
		boundary : {
			width : 300,
			height : 300
		},

	});
	$('.demo').croppie('bind', {
		url : 'demo/demo-1.jpg',
		points : [ 200, 470, 280, 740 ]
	});

	$('.demo-click').on('click', function(ev) {
		//alert(ev);
		$('.demo').croppie('result', {
			type : 'rawcanvas',
			// size: { width: 300, height: 300 },
			format : 'png'
		}).then(function(canvas) {
			$('.imgresult').children().attr("src", function() {
				return canvas.toDataURL();
			});
		});
	});

	var $uploadCrop;

	function readFile(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {

				$('.upload-demo').addClass('ready');
				$uploadCrop.croppie('bind', {
					url : e.target.result,
					orientation : 4
				}).then(function() {
					console.log('jQuery bind complete');
				});

			}

			//console.log(input.files[0]);
			reader.readAsDataURL(input.files[0]);
		} else {
			alert("Sorry - you're browser doesn't support the FileReader API");
		}
	}

	$uploadCrop = $('#upload-demo').croppie({
		viewport : {
			width : 150,
			height : 150,
			type : 'square'
		},
		boundary : {
			width : 300,
			height : 300
		},
		enableOrientation : true
	//enableExif: true
	});

	$('#upload').on('change', function() {
		readFile(this);
	});
	/* $('.upload-result').on('click', function (ev) {
		$uploadCrop.croppie('result', {
			type: 'canvas',
			size: 'viewport'
		}).then(function (resp) {
			console.log(resp);
		});
	}); */

	$('.upload-result').on('click', function(ev) {
		$uploadCrop.croppie('result', {
			type : 'canvas',
			size : 'viewport'
		}).then(function(canvas) {
			$('.imgresult').children().attr("src", function() {
				return canvas;
			});
		});
	});

	$('#left-lotate').on('click', function(ev) {
		$uploadCrop.croppie('rotate', 90);
	});

	$('#right-lotate').on('click', function(ev) {
		$uploadCrop.croppie('rotate', -90);
	});
</script>
</div>