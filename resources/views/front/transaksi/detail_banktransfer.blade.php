@extends('front.layout.app')

@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Detail Transaksi</h2>
            </div>
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row cart">
            <div class="col-md-12">
                <div class="invoice">
                    <div class="invoice-print">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="invoice-title">
                                    <h2>Invoice</h2>
                                    <div class="invoice-number">Order #{{ $order->order_no }}</div>
                                    @if($order->status == 'Pending')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-warning">Pending</span>
                                    </div>
                                    @elseif($order->status == 'Completed')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-success">Completed</span>
                                    </div>
                                    @elseif($order->status == 'Cancel')
                                    <div class="invoice-number">Order Status
                                        <span class="badge badge-danger">Batal</span>
                                    </div>
                                    @endif
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-6">
                                        <address>
                                            <strong>Invoice To</strong><br>
                                            {{ Auth::guard('customer')->user()->name }}<br>
                                            {{ Auth::guard('customer')->user()->address }},<br>
                                            {{ Auth::guard('customer')->user()->state }}, {{ Auth::guard('customer')->user()->city }}, {{ Auth::guard('customer')->user()->zip }}
                                        </address>
                                    </div>
                                    <div class="col-md-6 text-md-right">
                                        <address>
                                            <strong>Invoice Date</strong><br>
                                            {{ $order->booking_date }}
                                        </address>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-md-12">
                                <div class="section-title">Order Summary</div>
                                <p class="section-lead">Hotel room information are given below in detail:</p>
                                <hr class="invoice-above-table">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover table-md">
                                        <tr>
                                            <th>SL</th>
                                            <th>Room Name</th>
                                            <th class="text-center">Checkin Date</th>
                                            <th class="text-center">Checkout Date</th>
                                            <th class="text-center">Number of Adult</th>
                                            <th class="text-center">Number of Children</th>
                                            <th class="text-right">Subtotal</th>
                                        </tr>
                                        @php $total = 0; @endphp
                                        @foreach($order_detail as $item)
                                        @php
                                        $room_data = \App\Models\Room::where('id',$item->room_id)->first();
                                        @endphp
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $room_data->name }}</td>
                                            <td class="text-center">{{ $item->checkin_date }}</td>
                                            <td class="text-center">{{ $item->checkout_date }}</td>
                                            <td class="text-center">{{ $item->adult }}</td>
                                            <td class="text-center">{{ $item->children }}</td>
                                            <td class="text-right">
                                                @php
                                                $d1 = explode('/',$item->checkin_date);
                                                $d2 = explode('/',$item->checkout_date);
                                                $d1_new = $d1[2].'-'.$d1[1].'-'.$d1[0];
                                                $d2_new = $d2[2].'-'.$d2[1].'-'.$d2[0];
                                                $t1 = strtotime($d1_new);
                                                $t2 = strtotime($d2_new);
                                                $diff = ($t2-$t1)/60/60/24;
                                                $sub = $room_data->price*$diff;
                                                @endphp
                                                Rp. {{ $sub }}
                                            </td>
                                        </tr>
                                        @php
                                        $total += $sub;
                                        @endphp
                                        @endforeach
                                    </table>
                                </div>
                                <div class="row mt-4">
                                    <div class="col-lg-12 text-right">
                                        <div class="invoice-detail-item">
                                            <div class="invoice-detail-name">Total</div>
                                            <div class="invoice-detail-value invoice-detail-value-lg">Rp. {{ $total }}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="about-print-button">
                    <div class="text-md-right">
                        {{-- <h4>Metode Pembayaran Bank Transfer</h4> --}}
                        @if ($order->bukti_pembayaran != null)
                        <div class="card-body">
                            <div class="text-center">
                                    <h5>Bukti Pembayaran sudah di kirim nomor order id #{{ $order->order_no }}</h5>
                            </div>
                            <div class="text-center">
                                <img src="{{ asset('storage/' . $order->bukti_pembayaran) }}" alt=""
                                    class="img-fluid img-thumbnail rounded mx-auto d-block" />
                            </div>
                        </div>
                        @else
                        <div class="card-body">
                            <div class="text-center">
                                <h5>Belum ada bukti pembayaran</h5>
                            </div>
                        </div>
                        @endif
                        <span class="badge badge-info">Metode Pembayaran Bank Transfer. Konfirmasi manual oleh admin. Harap hubungi admin setelah melakukan upload bukti transfer</span>
                        @php

                        $cents = $order->paid_amount;
                        $customer_email = Auth::guard('customer')->user()->email;

                        @endphp
                        <form action="{{ route('kirimbukti') }}"
                        method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="form-group mt-4">
                            <label for="">Upload Bukti Pembayaran sekarang.</label>
                            <input type="hidden" name="order_no" value="{{ $order->order_no }}">
                            <input type="file" name="bukti_pembayaran" id=""
                                class="form-control" required>
                        </div>
                        <div class="text-right mt-4">
                            <button type="submit" class="btn btn-primary">Kirim</button>
                        </div>
                    </form>
                        {{-- <a href="javascript:window.print();" class="btn btn-warning btn-icon icon-left text-white print-invoice-button"><i class="fa fa-print"></i> Print</a> --}}
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
