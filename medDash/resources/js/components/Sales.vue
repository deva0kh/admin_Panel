<template>
 <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Commandes</h3>

                <div class="card-tools">
                    <button class="btn btn-info" @click="newModal">
                        Ajouter  <i class="fas fa-briefcase fa-fw" ></i></button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                     <tr>
                        <th>ID</th>
                        <th>Service</th>
                        <th>Client</th>
                        <th>Price</th>
                        <th>Credit</th>
                        <th>Address</th>
                        <th>Date</th>
                        <th>Statut</th>
                        <th>Modify</th>
                  </tr>
                  <tr v-for="sale in sales.data" :key="sale.id">

                    <td>{{sale.id}}</td>
                    <td>{{sale.service}}</td>
                    <td>{{sale.client}}</td>
                    <td>{{sale.price }}</td>
                    <td>
                        <p v-if="sale.bio === 'Done' && (sale.price - sale.payement ) !=0" class="btn btn-danger">
                        {{(sale.price - sale.payement )}}</p>
                        <p v-else  >{{(sale.price - sale.payement )}}</p>
                    </td>
                 
                 
                    <td>{{sale.address }}</td>
                    <td>{{sale.created_at | timeFilter}}</td>
             
                    <td><p v-if="sale.bio === 'Pending'" class="btn btn-danger"  >{{sale.bio}}</p>
                    <p v-else class="btn btn-success"  >{{sale.bio}}</p>
                    </td>

                    <td>
                        <a href="#" @click='editSale(sale)'>
                            <i class="fa fa-edit blue"></i>
                        </a>
                        /
                        <a href="#" @click='printSale(sale.id)' >
                            <i class="fa fa-print panel-col"></i>
                        </a>
                        

                    </td>
                  </tr>

                
                </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div></div>
       
       
        <!--modal-->
 
    <div class="modal fade" id="addSale" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 v-if="editMode" class="modal-title" id="exampleModalLabel">Modifier la commande</h5>
        <h5 v-else-if="!editMode" class="modal-title" id="exampleModalLabel">ajouter une commande</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form @submit.prevent="editMode ? updateSale():createSale()">
      <div class="modal-body">
               
         <div class="form-group">
            
            <input v-model="form.service" placeholder="Service" type="text" name="service"
                class="form-control" :class="{ 'is-invalid': form.errors.has('service') }">
            <has-error :form="form" field="service"></has-error>
            </div>
        <div class="form-group">
            
            <input v-model="form.client" placeholder="Client" type="text" min="0.00" name="client"
                class="form-control" :class="{ 'is-invalid': form.errors.has('client') }">
            <has-error :form="form" field="client"></has-error>
            </div>

         <div class="form-group">
             <input v-model="form.price" placeholder="Prix" type="number"  min="0.00" step="0.1" name="price"
                class="form-control" :class="{ 'is-invalid': form.errors.has('price') }">
            <has-error :form="form" field="price"></has-error> 
            </div>
            <div class="form-group">
             <input v-model="form.payement" placeholder="Payement" step="0.1" type="number" name="payement"
                class="form-control" :class="{ 'is-invalid': form.errors.has('payement') }">
            <has-error :form="form" field="payement"></has-error>
            </div>
         
           
            <div class="form-group">
                     

            
            <input v-model="form.address" placeholder="Address" type="text" name="address"
                class="form-control" :class="{ 'is-invalid': form.errors.has('address') }">
            <has-error :form="form" field="address"></has-error>
            </div>

        
            <div class="form-group">
                        <input disabled  v-model="form.bio" name="bio" id="bio"
                        placeholder="Pending" value ="Pending"
                        class="form-control" :class="{ 'is-invalid': form.errors.has('bio') }"> 
                        <has-error :form="form" field="bio"></has-error>
                    </div>

         


        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-danger " data-dismiss="modal">Fermer</button>
        <button v-if="editMode" type="submit" class="btn btn-primary">Modifier</button>
        <button v-else-if="!editMode" type="submit" class="btn btn-primary">Sauvgarder</button>
      </div>
     </form>
       </div>
     
  </div>
    </div>
    </div>

</template>

<script>

    export default {
      methods:{
        newModal(){
          this.editMode=false;
          this.form.reset();
               $('#addSale').modal('show');
        },
         editSale(sale){
           this.editMode=true;
           
          this.form.fill(sale);
          
         
               $('#addSale').modal('show');
        },


            updateSale(){
                this.$Progress.start()
               this.form.put('api/sale/'+this.form.id).then(()=>{
                 Fire.$emit('afterCrudeEvent');
                toast.fire({
                  icon: 'success',
                  title:'Utilisateur modifier avec succès'
                })
                 $('#addSale').modal('hide');
                
                  


               }).catch(()=>{
                   this.$Progress.fail()
               })
          this.$Progress.finish()
            },
            createSale(){
              this.$Progress.start()

               this.form.post('api/sale').then(()=>{ 
                 toast.fire({
                  icon: 'success',
                  title:'Utilisateur crée avec succès'
                })
                $('#addSale').modal('hide');
                this.loadSale();
                })
         
                           
              
               this.$Progress.finish();
            },


            loadSale(){
              this.$Progress.start();
              axios.get("api/sale").then(({ data }) => (this.sales = data));
            this.$Progress.finish();
           },


      /*  deleteSale(id){
             this.$Progress.start();
          
           Swal.fire({
                title: 'vous êtes sûre?',
                text: "cette opération est irréversible!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Oui, supprimer!'
              }).then((result) => {
                if (result.value) {
                   this.form.delete("api/user/"+id);
                   Fire.$emit('afterCrudeEvent');
                  Swal.fire(
                    'Supprimer!',
                    'Utilisateur supprimer.',
                    'success'
                  )
                }
              })

         
           this.$Progress.finish();
           }*/
      },
      
        data(){
         
            return{
              sales:{},
              editMode:false,
                form:new Form({
                    id:'',
                    service:'',
                    client:'',
                    price:'',
                    payement:'',
                    address:'',
                    bio:'',
                    
                })
            }
        },
        created() {
              this.loadSale();
            Fire.$on('afterCrudeEvent',()=> {
              this.loadSale();
            });
        }
    }
    
</script>
