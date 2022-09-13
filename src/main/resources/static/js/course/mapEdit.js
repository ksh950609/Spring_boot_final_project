document.write('<script type=\"text/javascript\" src=\"timelineEdit.js\"><\/script>');
// 코스를 담을 배열입니다.
var positions = [];
// 코스에 저장된 장소 마커를 담을 배열입니다.
var courseMarkers = [];
// 검색 결과 마커를 담을 배열입니다
var markers = [];

var map;

$(document).ready(function (){

	let firstExhbn = $("#firstExhbnTitle").text();
	let firstAddr = $("#firstExhbnAddr").text();

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	ps.keywordSearch(firstAddr, firstSearch);

	// 검색 버튼
	$("#keyword_search").on("click",function (){
		searchPlaces();
	});

	var mapContainer = document.getElementById('courseMap'), // 지도를 표시할 div
		mapOption = {
			center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
		};
	// 지도를 생성합니다
	map = new kakao.maps.Map(mapContainer, mapOption);

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var bounds = new kakao.maps.LatLngBounds();

// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

	for (var i = 0; i < positions.length; i ++) {

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new kakao.maps.Size(24, 35);

		// 마커 이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: new kakao.maps.LatLng(positions[0].y,positions[0].x), // 마커를 표시할 위치
			title : positions[i].place_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage // 마커 이미지
		});
	}

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:10});

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		let searchOption = {
			size:10,
			page:20,
			SortBy:'DISTANCE',
			radius:3000,
			location: new kakao.maps.LatLng(positions[0].y,positions[0].x)
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch( keyword, placesSearchCB,searchOption);
	}

	// 첫번째 검색결과를 리턴하는 콜백 함수입니다.
	function firstSearch(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			let temp = {
				place_name: firstExhbn,
				category_group_name : data[0].category_group_name,
				phone :data[0].phone,
				address_name :data[0].address_name,
				road_address_name : firstAddr,
				x : data[0].x,
				y : data[0].y,
				place_url : data[0].place_url,
				place_memo : "",
			}

			positions.push(temp);

			var marker = new kakao.maps.Marker({
				positions: new kakao.maps.LatLng(positions[0].y, positions[0].x)
			});

			panTo(positions[0].y, positions[0].x);
			addCourseMarker(new kakao.maps.LatLng(positions[0].y,positions[0].x),0);

			return;

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'),
			menuEl = document.getElementById('menu_wrap'),
			fragment = document.createDocumentFragment(),
			bounds = new kakao.maps.LatLngBounds(),
			listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for ( var i=0; i<places.length; i++ ) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
				marker = addMarker(placePosition, i),
				itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			(function(places, i) {
				kakao.maps.event.addListener(marker, 'click', function() {
					addCourseItem(places, i);
				});

				itemEl.onclick = function () {
					addCourseItem(places, i);
				};

			})(places, i);

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover =  function () {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout =  function () {
					infowindow.close();
				};

			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'),
			itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
				'<div class="info">' +
				'   <h3>' + places.place_name + '</h3>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>' +
				'   <span class="jibun gray">' +  places.address_name  + '</span>';
		} else {
			itemStr += '    <span>' +  places.address_name  + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone  + '</span>' +
			'</div>';

		el.innerHTML = itemStr;
		el.className = 'searchItem';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(37, 37),  // 마커 이미지의 크기
			imgOptions =  {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			},
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			marker = new kakao.maps.Marker({
				position: position, // 마커의 위치
				image: markerImage
			});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		return marker;
	}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
			markers[i].setMap(null);
		}
		markers = [];
	}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'),
			fragment = document.createDocumentFragment(),
			i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild (paginationEl.lastChild);
		}

		for (i=1; i<=pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i===pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild (el.lastChild);
		}
	}

	function addCourseItem(data, idx) {
		console.log(JSON.stringify(data[idx]));
		if(confirm("코스에 추가하시겠습니까?")) {
			var temp = {
				place_name: data[idx].place_name,
				category_group_name : data[idx].category_group_name,
				phone :data[idx].phone,
				address_name :data[idx].address_name,
				road_address_name :data[idx].road_address_name,
				x : data[idx].x,
				y : data[idx].y,
				place_url : data[idx].place_url,
				place_memo : "",
			}

			positions.push(temp);

			let li = document.getElementsByClassName("route-row");
			$(".courseItem").remove();

			createList();
			let newMarker = new kakao.maps.LatLng(positions[positions.length-1].y, positions[positions.length-1].x)
			addCourseMarker(newMarker, positions.length-1);
		}
	}

	function panTo(y,x) {
		// 이동할 위도 경도 위치를 생성합니다
		var moveLatLon = new kakao.maps.LatLng(y, x);

		// 지도 중심을 부드럽게 이동시킵니다
		// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
		map.panTo(moveLatLon);
	}

}); // document ready

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addCourseMarker(position, idx, title) {
	var imageSrc = '/image/map_markers_black.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(37, 37),  // 마커 이미지의 크기
		imgOptions =  {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx*46)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		},
		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: position, // 마커를 표시할 위치
			// title : positions[idx].place_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			image : markerImage // 마커 이미지
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	courseMarkers.push(marker);  // 배열에 생성된 마커를 추가합니다

	return marker;
}
/** y좌표값, x좌표값, 인덱스 입력시 마크 그리기 */
function addCourseMarker2(y,x, idx, title) {
	var imageSrc = '/image/map_markers_black.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(37, 37),  // 마커 이미지의 크기
		imgOptions =  {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx*46)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		},
		markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
	var marker = new kakao.maps.Marker({
		map: map, // 마커를 표시할 지도
		position: new kakao.maps.LatLng(y, x), // 마커를 표시할 위치
		// title : positions[idx].place_name, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		image : markerImage // 마커 이미지
	});

	marker.setMap(map); // 지도 위에 마커를 표출합니다
	courseMarkers.push(marker);  // 배열에 생성된 마커를 추가합니다

	return marker;
}