


<?php

require("baglan.php");
if(!$baglan){
	die("Bağlantı Başarısız".mysqli_connect_error());
}
else{
	echo "VERİLER EKLENDİ";
}



$ekle=$_POST["ekle"];
if(isset($ekle)){
	$dosya_id=$_POST["dosya_id"];
	$dosya_yeri=$_POST["dosya_yeri"];
	$dosya_acilis_tarihi=$_POST["dosya_acilis_tarihi"];
	$musteri_id=$_POST["musteri_id"];
	$musteri_ad=$_POST["musteri_ad"];
	$musteri_soyad=$_POST["musteri_soyad"];
	$musteri_tc=$_POST["musteri_tc"];
	$dosya_tur_id=$_POST["dosya_tur_id"];
	$dosya_tur_id=$_POST["dosya_tur_id"];
	
	
	
	$sql="INSERT INTO `musteriler` (`musteri_id`, `musteri_ad`, `musteri_soyad`, `musteri_tc`, `dosya_tur_id`) VALUES ('$musteri_id', '$musteri_ad', '$musteri_soyad', '$musteri_tc', '$dosya_tur_id')";

	
	$sql1="INSERT INTO `dosyalar` (`dosya_id`, `dosya_acilis_tarihi`, `dosya_yeri`, `dosya_tur_id`) VALUES ('$dosya_id', '$dosya_acilis_tarihi', '$dosya_yeri', '$dosya_tur_id')";
	
	$srg=mysqli_query($baglan,$sql) or die("MySQL error: " . mysqli_error($baglan));
	//if(mysqli_num_rows($srg)>0){
		//while($row=mysqli_fetch_array($srg)){ 
		//}
	//}//else{
		//echo "Kayıt Bulunamadı";
	
	//}
	$srg1=mysqli_query($baglan,$sql1) or die("MySQL error: " . mysqli_error($baglan));
	//if(mysqli_num_rows($srg1)>0){
		//while($row=mysqli_fetch_array($srg1)){ 
	//}
	//}//else{
		//echo "Kayıt Bulunamadı";
	//}


}


mysqli_close($baglan);


?>

