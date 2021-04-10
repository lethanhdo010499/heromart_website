@extends('master')
@section('content')
	<div class="container box-titile mb-5" style="border-color: #3560DC;">
		<div class="bder" style="background-color: #3560DC;">
			<h4 class="list-product-title">SEARCH RESULTS</h4>
		</div>
	</div>
	<div class="row">
        @foreach ($sanpham as $new)
        <div class="col-sm-3">
            <div class="border-0 rounded-0 card  mb-5 mx-auto" style="width: 13rem; background: white;">
                <img class="card-img-top" height="150px" src="../storage/app/product/{{$new->image}}" alt="Card image cap">
                <div class="card-body position-relative p-0">
                    <div class="px-4 py-3" style="height: 6.5rem">
                        <span style="color: #555; font-size: 14px"><b>{{$new->name}}</b></span><br />
                        @if($new->promotion_price==0)
                            <span style="color:#FF3924;"><b>{{$new->unit_price}}đ/{{$new->unit}}</b></span>
                        @else
                            <small class="mr-2" style="color:#808080;"><del>{{$new->unit_price}}đ</del></small>
                            <span style="color:#FF3924;"><b>{{$new->promotion_price}}đ/{{$new->unit}}</b></span>
                        @endif
                    </div>
                    <div class="hovered p-0" style="width: 100%; height: 100%; background:white;">
                        <div class="d-flex align-content-center btn-hover float-left"><a href="{{route('chi-tiet-san-pham', $new->id)}}" style="width: 100%"><img class="img-icon2" style="height: 100%"
                                src="source/style_frontend/style/src/Asset 14@3x.png" /></a></div>
                        <div class="d-flex align-content-center btn-hover float-right"><img
                                class="img-icon2" src="source/style_frontend/style/src/Asset 13@3x.png" /></div>
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
@endsection()