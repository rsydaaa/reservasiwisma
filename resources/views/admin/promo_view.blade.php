@extends('admin.layout.app')

@section('heading', 'Promo Rooms')

@section('right_top_button')
<a href="{{ route('admin_promo_add') }}" class="btn btn-primary"><i class="fa fa-plus"></i> Add Promo</a>
@endsection

@section('main_content')
    <div class="section-body">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="example1">
                                <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Nama Promo</th>
                                        <th>Nama Wisma</th>
                                        <th>Nama Kamar</th>
                                        <th>Tanggal Mulai</th>
                                        <th>Tanggal Akhir</th>
                                        <th>Kuota</th>
                                        <th>Discount</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($promo as $row)
                                        <tr>
                                            <td>{{ $loop->iteration }}</td>
                                            <td>{{ $row->id }}</td>
                                            <td>{{ $row->payment_method }}</td>
                                            <td>
                                                @if ($row->status == 'Pending')
                                                    <span class="badge badge-warning">Pending</span>
                                                @elseif($row->status == 'Completed')
                                                    <span class="badge badge-success">Completed</span>
                                                @elseif($row->status == 'Cancel')
                                                    <span class="badge badge-danger">Batal</span>
                                                @endif
                                            </td>
                                            <td>{{ $row->booking_date }}</td>
                                            <td>Rp. {{ number_format($row->paid_amount, 0) }}</td>
                                            <td class="pt_10 pb_10">
                                                <a href="{{ route('admin_invoice', $row->id) }}"
                                                    class="btn btn-primary">Detail</a>
                                                <a href="{{ route('admin_invoice_edit', $row->id) }}"
                                                    class="btn btn-info">Edit</a>
                                                <a href="{{ route('admin_order_delete', $row->id) }}" class="btn btn-danger"
                                                    onClick="return confirm('Are you sure?');">Delete</a>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
