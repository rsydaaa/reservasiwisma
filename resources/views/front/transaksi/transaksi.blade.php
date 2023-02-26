@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>History Transaksi</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row cart">
            <div class="col-md-12">



                <div class="table-responsive">
                    <table class="table table-bordered table-cart" id="example1">
                        <thead>
                            <tr>
                                <th>SL</th>
                                <th>Order No</th>
                                <th>Payment Method</th>
                                <th>Payment Status</th>
                                <th>Booking Date</th>
                                <th>Paid Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($orders as $row)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $row->order_no }}</td>
                                <td>{{ $row->payment_method }}</td>
                                <td>
                                    @if($row->status == 'Pending')
                                    <span class="badge badge-warning">Pending</span>
                                    @elseif($row->status == 'Completed')
                                    <span class="badge badge-success">Completed</span>
                                    @elseif($row->status == 'Cancel')
                                    <span class="badge badge-danger">Batal</span>
                                    @endif
                                <td>{{ $row->booking_date }}</td>
                                <td>{{ $row->paid_amount }}</td>
                                <td class="pt_10 pb_10">
                                    @if ($row->payment_method == 'Midtrans')
                                    <a href="{{ route('transaksi_detail',$row->id) }}" class="btn btn-primary">Detail</a>
                                    @else
                                    <a href="{{ route('transaksi_detail_bank',$row->id) }}" class="btn btn-primary">Detail</a>
                                    @endif
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>

                <div class="checkout mb_20">
                    {{-- <a href="{{ route('checkout') }}" class="btn btn-primary bg-website">Checkout</a> --}}
                </div>


            </div>
        </div>
    </div>
</div>
@endsection
