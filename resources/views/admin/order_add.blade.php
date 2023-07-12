@extends('admin.layout.app')

@section('heading', 'Add Order')

@section('right_top_button')
<a href="{{ route('admin_orders') }}" class="btn btn-primary"><i class="fa fa-eye"></i> Back</a>
@endsection

@section('main_content')
<div class="page-top">
    <div class="bg"></div>
    <div class="container">
        <div class="row">
        </div>
    </div>
</div>
<div class="page-content">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-6 checkout-left">

                <form action="{{ route('admin_order_store') }}" method="post">
                @csrf
                    <div class="billing-info">
                       
                        <div class="row">
                        <h4 class="mb_30">Data Customer</h4>
                            <div class="col-lg-6">
                            
                                <label for="">Pilih Customer: *</label>
                                    <select name="arr_customer[]" id="customer" class="form-control mb_15" onchange="getCustomer()">
                                        <option value="">== Select Customer ==</option>
                                        @php $a=0; @endphp
                                        @foreach($all_customer as $name)
                                        <option value="{{ $name->id }}"> {{$name->name}}</option>
                                        @endforeach
                                    </select>
                       
                                <label for="">Name: *</label>
                                <input type="text" class="form-control mb_15" id="name" name="name">
                          
                                <label for="">Email Address: *</label>
                                <input type="text" class="form-control mb_15" id="email" name="email">
                            
                                <label for="">Phone Number: *</label>
                                <input type="text" class="form-control mb_15" id="phone" name="phone">
                           
                                <label for="">Country: *</label>
                                <input type="text" class="form-control mb_15" name="country">
                            </div>

                            <div class="col-lg-6">
                                <label for="">Address: *</label>
                                <input type="text" class="form-control mb_15" name="address" >
                            
                            
                                <label for="">State: *</label>
                                <input type="text" class="form-control mb_15" name="state" >
                          
                                <label for="">City: *</label>
                                <input type="text" class="form-control mb_15" name="city" >
                            
                                <label for="">Zip Code: *</label>
                                <input type="text" class="form-control mb_15" name="zip" >
                           
                            </div>
                            
                            <div class="col-lg-6">
                            <h4 class="mb_30">Data Room</h4>
                                <label for="">Date Check-in: *</label>
                                <input type="date" class="form-control mb_15" name="checkin" >
                            
                            
                                    <label for="">Date Check-out *</label>
                                    <input type="date" class="form-control mb_15" name="checkout" >
        
                                    
                            <label for="">Select Room</label>
                                
                                    <select name="arr_room[]" id="room" class="form-control mb_15" onchange="getPrice()">
                                        <option value="">== Select Room ==</option>
                                        @php $i=0; @endphp
                                        @foreach($all_room as $item)
                                        <option value="{{ $item->id }}"> {{$item->name}}</option>
                                        @endforeach
                                    </select>

                               
                                <label for="">Pilih cara pembayaran: *</label>
                                <select name="payment_method" class="form-control mb_15" id="paymentMethodChange" autocomplete="off" required>
                                    <option value="cash">Cash</option>
                                </select>

                                <label for="">Adult: *</label>
                                <input type="number" class="form-control mb_15" name="adult" >

                                <label for="">Childern:*</label>
                                <input type="number" class="form-control mb_15" name="children" >
                            </div>

                           
                            <div class="col-lg-6">
                            <h4 class="mb_30">Price</h4>
                            <label for="">Price Room: </label>
                            <input type="text" class="form-control mb_15" id="price" name="price" >
                            
                            
                            <label for="">Price Total: </label>
                            <input type="text" class="form-control mb_15" id="price" name="price" >
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary bg-website mb_30">Continue to payment</button>
                </form>
            </div>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function getCustomer() {
        var customer =  document.getElementById("customer").value;
        fetch('/admin/order/get_customer?id='+customer)
        .then(res=>res.json()).then(data=>{
            document.getElementById("name").value=data.result['name'];
            document.getElementById("email").value=data.result['email'];
            document.getElementById("phone").value=data.result['phone'];
        })
    }

    function getPrice() {
        var room = document.getElementById("room").value;
        fetch('/admin/order/get_room?id='+room)
        .then(res=>res.json()).then(data=>{
            document.getElementById("price").value=data.result['price'];
        })
    }
</script>
@endsection