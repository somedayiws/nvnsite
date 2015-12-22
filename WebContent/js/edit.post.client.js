/**
 * Edit post client page Somedayiws Website jpvn.net
 */
function xem(f) {
	var reader = new FileReader();
	reader.onload = function(e) {
		var img = document.getElementById("fu2");
		img.src = e.target.result;
		img.style.display = "inline";
	};
	reader.readAsDataURL(f.files[0]);
}

function DichBai(x) {
	if (x)
		$('#dichbai').val('dich');
	else
		$('#dichbai').val('khong');
	$('#fdangbai').submit();
}
function LuuBai() {
	$('#dichbai').val('luu');
	$('#fdangbai').submit();
}
function DichBai1() {
	var value = CKEDITOR.instances['NoiDung'].getData();
	var donvi = $("#sotu").val();
	var giavn = $("#giavn").val();
	var giaja = $("#giaja").val();
	/* alert("Xem : " + value.length); */
	$("#thongbaodich").html(
			"Giá của bài dịch này là - この記事は翻訳された価格です "
					+ Math.ceil(value.split(/[ .,?!]+/).length * giavn / donvi)
					+ "VND("
					+ Math.ceil(value.split(/[ .,?!]+/).length * giaja / donvi)
					+ "JPY)</br>この記事の価格は "
					+ Math.ceil(value.split(/[ .,?!]+/).length * giavn / donvi)
					+ "VND("
					+ Math.ceil(value.split(/[ .,?!]+/).length * giaja / donvi)
					+ "JPY)です。");
}
//Hiện ẩn tùy chọn
var giatritruoc = "";
function hienan() {
	var giatri = $('#NgonNgu').val();
	if (giatri == "2") {
		//Dong bo du lieu
		if(giatritruoc == "0" || giatritruoc == ""){
			$("#TieuDeVi").val($("#TieuDe").val());
			$("#MoTaVi").val($("#MoTa").val());
			CKEDITOR.instances.NoiDungVi.setData(CKEDITOR.instances.NoiDung.getData());
		}else if(giatritruoc == "1"){
			$("#TieuDeJa").val($("#TieuDe").val());
			$("#MoTaJa").val($("#MoTa").val());
			CKEDITOR.instances.NoiDungJa.setData(CKEDITOR.instances.NoiDung.getData());
		}
		$('.donngu').hide();
		$('.dangu').show();
	} else if(giatri == "1"){
		//Dong bo du lieu
		if(giatritruoc == "2"){
			$("#TieuDe").val($("#TieuDeJa").val());
			$("#MoTa").val($("#MoTaJa").val());
			CKEDITOR.instances.NoiDung.setData(CKEDITOR.instances.NoiDungJa.getData());
			$('.dangu').hide();
			$('.donngu').show();
		}
	} else {
		if(giatritruoc == "2"){
			$("#TieuDe").val($("#TieuDeVi").val());
			$("#MoTa").val($("#MoTaVi").val());
			CKEDITOR.instances.NoiDung.setData(CKEDITOR.instances.NoiDungVi.getData());
			$('.dangu').hide();
			$('.donngu').show();
		}
	}
	giatritruoc = giatri;
}

//Validate form
$(document).ready(function() {
	$(document).ready(function() {
		$("#fdangbai").validate({
			rules : {
				TieuDe : {
					required : true,
					maxlength: 80
				},
				TieuDeVi : {
					required : true,
					maxlength: 80
				},
				TieuDeJa : {
					required : true,
					maxlength: 80
				},
				MoTa : {
					required : true,
					maxlength: 200
				},
				TheLoai : {
					required : true
				},
				NgonNgu: {
					required : true
				},
				MoTaVi : {
					required : true,
					maxlength: 200
				},
				MoTaJa : {
					required : true,
					maxlength: 150
				}
			},
			messages : {
				TieuDe : {
					required : "Chưa nhập tiêu đề - テーマをまだ入力しない。!",
					maxlength : "Tiêu đề quá dài - テーマが長いです。!<br>"
				},
				TieuDeJa : {
					required : "日本語でテーマをまだ入力しない。!",
					maxlength : "テーマが長いです。!<br>"
				},
				TieuDeVi : {
					required : "Chưa nhập tiêu đề tiếng Việt!",
					maxlength : "Tiêu đề quá dài!<br>"
				},
				MoTa : {
					required : "Chưa nhập mô tả - 記されていない。!",
					maxlength : "Mô tả quá dài -  記された説明が長いです。!<br>"
				},
				TheLoai : {
					required : "Chọn đúng danh mục - 項目を正しく選択する"
				},
				NgonNgu: {
					required : "Hãy chọn ngôn ngữ - 言語を選択する"
				},
				MoTaVi : {
					required : "Chưa nhập mô tả!",
					maxlength : "Mô tả quá dài!<br>"
				},
				MoTaJa : {
					required : "記されていない。!",
					maxlength : "記された説明が長いです。!<br>"
				}
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
});