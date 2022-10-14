const likeButton = document.querySelector("#likeButton");
const likeUpDown = document.querySelector("#likeUpDown");
const item_num = document.querySelector("#item_num").value;
const user_id = document.querySelector("#user_id").value;
const item_price = document.querySelector("#item_price").value;
const category1 = document.querySelector("#category1");
const category2 = document.querySelector("#category2");
const category3 = document.querySelector("#category3");
const category4 = document.querySelector("#category4");
let json = JSON.parse(document.querySelector('#json').innerHTML);
const minus = document.querySelector("#minus");
const plus = document.querySelector("#plus");
const itemCount = document.querySelector("#itemCount");
const reviewContents = document.querySelector("#reviewContents");
const reviewBtn = document.querySelector("#reviewBtn");
const reviewCount = document.querySelector("#reviewCount");


//----------------------------리뷰등록----------------------------
reviewContents.addEventListener("click", function (event) {
    let item_num = document.getElementById("item_num").value;
    let user_id = document.getElementById("user_id").value;
    let rv_title = document.getElementById("rv_title").value;
    let rv_contents = document.getElementById("rv_contents").value;
    let rv_star = document.getElementById("rv_star").value;

    //modal 등록 버튼 클릭
    if (event.target.classList[0] == "review") {
        console.log(item_num.value)
        console.log(user_id.value)
        console.log(rv_title.value)
        console.log(rv_contents.value)
        console.log(rv_star.value)

        //1. XMLHTTPRequest 생성
        const xhttp = new XMLHttpRequest();
        //2. Method, URL 준비
        xhttp.open('POST', 'review');
        //3.Enctype(POST일 경우만 header 정보 요청)
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        //4. 요청 전송(POST일 경우 파라미터 추가)
        xhttp.send('item_num='+item_num+'&user_id='+user_id+'&rv_title='+rv_title+'&rv_contents='+rv_contents+'&rv_star='+rv_star);
        //5. 응답 처리
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4 && xhttp.status == 200) {
                let result = xhttp.responseText.trim();
                if (result > 0) {
                    alert("등록되었습니다");
                } else {
                }
            }
        }
    }
})




//----------------------------리뷰수 조회----------------------------
function getReviweCount() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "reviewCount?item_num="+item_num);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let count = xhttp.responseText;
            console.log(count);
            reviewCount.innerHTML = count;
        }
    }
}



//-----------------------리뷰 불러오기-----------------------
function getReview(pager) {
    let item_num = document.getElementById("item_num").value;
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "reviewList?item_num="+item_num+"&pager="+pager);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            reviewContents.innerHTML = xhttp.responseText;
        }
    }
}

//----------------------------공유하기----------------------------
function share(sns) {
    var thisUrl = document.URL;
    var snsTitle = "구디나라 대기공주";
    if (sns == 'facebook') {
        var url = "http://www.facebook.com/sharer/sharer.php?u=" + encodeURIComponent(thisUrl);
        window.open(url, "", "width=486, height=286");
    }
    else if (sns == 'twitter') {
        var url = "http://twitter.com/share?url=" + encodeURIComponent(thisUrl) + "&text=" + encodeURIComponent(snsTitle);
        window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
    }
    else if (sns == 'band') {
        var url = "http://www.band.us/plugin/share?body=" + encodeURIComponent(snsTitle) + "&route=" + encodeURIComponent(thisUrl);
        window.open(url, "shareBand", "width=400, height=500, resizable=yes");
    }
}


//-----------------------수량선택-----------------------
const hap = document.querySelector("#hap");
const price = document.querySelector("#price");
hap.innerHTML = 1;
plus.addEventListener("click", function () {
    let count = parseInt(itemCount.value);
    let plusCount = count + 1;
    if (plusCount > json.item_stock) {
        itemCount.value = count;
        hap.innerHTML = itemCount.value;
    } else {
        itemCount.value = plusCount;
        hap.innerHTML = itemCount.value;
    }
})
minus.addEventListener("click", function () {
    let count = parseInt(itemCount.value);
    let minusCount = count - 1;
    if (minusCount < 1) {
        itemCount.value = count;
        hap.innerHTML = itemCount.value;
    } else {
        itemCount.value = minusCount;
        hap.innerHTML = itemCount.value;
    }
})





//----------------------------좋아요(찜하기)----------------------------
likeButton.addEventListener('click', function () {
    const count = parseInt(likeUpDown.innerHTML);
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", "./like");
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send("item_num=" + item_num + "&user_id=" + user_id);
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let result = xhttp.responseText.trim();
            if (result == 1) {
                likeButton.setAttribute("class", "wish_img_box bi bi-heart-fill");
                likeUpDown.innerHTML = count + 1;
            } else {
                likeButton.setAttribute("class", "wish_img_box bi bi-heart");
                likeUpDown.innerHTML = count - 1;
            }
        }
    }
})


//----------------------------좋아요수 조회----------------------------
function getLikeCount() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "likeCount?item_num=" + item_num);
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let count = xhttp.responseText;
            likeUpDown.innerHTML = count;
        }
    }
}



//----------------------------카테고리 나열----------------------------
function getCategory() {
    const xhttp = new XMLHttpRequest();
    xhttp.open("GET", "category");
    xhttp.send();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            let jsonData = JSON.parse(this.responseText.trim());
            let c1 = json.cate1;
            let c2 = json.cate2;
            let c3 = json.cate3;
            let c4 = json.cate4;

            for (c of jsonData) {
                if (c1 == c.cate_num) {
                    category1.innerHTML = c.cate_name + ' > ';
                }

                if (c2 == c.cate_num && c3 == null) {
                    category2.innerHTML = c.cate_name;
                } else if (c2 == c.cate_num) {
                    category2.innerHTML = c.cate_name + ' > ';
                }

                if (c3 == c.cate_num && c4 == null) {
                    category3.innerHTML = c.cate_name;
                } else if (c3 == c.cate_num) {
                    category3.innerHTML = c.cate_name + ' > ';
                }

                if (c4 == c.cate_num) {
                    category4.innerHTML = c.cate_name;
                }
            }
        }
    }
}
