<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Sale;

class SaleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Sale::latest()-> paginate(100);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        

        $this->validate($request,[
            'service' => 'required|string|max:191',
            'price' => 'required',
     
        ]);
       return Sale::create([
            'service' => $request['service'],
            'address' => $request['address'],
            'client' => $request['client'],
            'price' =>intval($request['price']) ,
            'payement'=>intval($request['payement']) ,
            'bio' => "Pending",

            
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
       
        $sale =Sale::findOrFail($id);
        $this->validate($request,[
            'service' => 'required|string|max:191',
            'price' => 'required',
        ]);
        
        $sale ->update ($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
