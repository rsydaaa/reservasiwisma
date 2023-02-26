@extends('admin.layout.app')

@section('heading', 'Order Invoice')

@section('main_content')
    <style>
        .badge-warning {
            color: #212529;
            background-color: #ffc107;
        }

        .badge-warning[href]:hover,
        .badge-warning[href]:focus {
            color: #212529;
            text-decoration: none;
            background-color: #d39e00;
        }
    </style>
    <div class="section-body">
        <div class="invoice">
            <div class="invoice-print">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="invoice-title">
                            <h2>Invoice</h2>
                            <div class="invoice-number">Order #{{ $order->order_no }}
                                @if ($order->status == 'Pending')
                                    <span class="badge badge-warning">Order Status Pending</span>
                                @elseif($order->status == 'Completed')
                                    <span class="badge badge-success">Order Status Completed</span>
                                @elseif($order->status == 'Cancel')
                                    <span class="badge badge-danger">Order Status Batal</span>
                                @endif
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <address>
                                    <strong>Invoice To</strong><br>
                                    {{ $customer_data->name }}<br>
                                    {{ $customer_data->address }},<br>
                                    {{ $customer_data->state }}, {{ $customer_data->city }}, {{ $customer_data->zip }}
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
                                @foreach ($order_detail as $item)
                                    @php
                                        $room_data = \App\Models\Room::where('id', $item->room_id)->first();
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
                                                $d1 = explode('/', $item->checkin_date);
                                                $d2 = explode('/', $item->checkout_date);
                                                $d1_new = $d1[2] . '-' . $d1[1] . '-' . $d1[0];
                                                $d2_new = $d2[2] . '-' . $d2[1] . '-' . $d2[0];
                                                $t1 = strtotime($d1_new);
                                                $t2 = strtotime($d2_new);
                                                $diff = ($t2 - $t1) / 60 / 60 / 24;
                                                $sub = $room_data->price * $diff;
                                            @endphp
                                            ${{ $sub }}
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
                                    <div class="invoice-detail-value invoice-detail-value-lg">Rp.
                                        {{ number_format($total, 0) }}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="about-print-button">
            <div class="text-md-right">
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
                    {{-- <form action="{{ route('kirimbukti') }}"
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
                    </form> --}}
                @endif
                <form action="{{ route('admin_invoice_update') }}" method="POST">
                    @csrf
                    <div class="form-group @error('status') has-error @enderror">
                        <label for="status">Status</label>
                        <input type="hidden" name="order_id" value="{{ $order->id }}">
                        <select name="status" id="status" class="form-control">
                            <option value="Pending" @if ($order->status == 'Pending') selected @endif>Pending</option>
                            <option value="Completed" @if ($order->status == 'Completed') selected @endif>Completed</option>
                            <option value="Cancel" @if ($order->status == 'Cancel') selected @endif>Cancel</option>
                        </select>
                        @error('status')
                            <span
                                class="help-block
                @error('status') has-error @enderror">{{ $message }}</span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">
                            Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
