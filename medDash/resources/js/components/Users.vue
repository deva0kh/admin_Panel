<template>
 <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">gérer les utilisateurs</h3>

                <div class="card-tools">
                    <button class="btn btn-success" @click="newModal">
                        Ajouter  <i class="fas fa-user-plus fa-fw" ></i></button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                     <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Email</th>
                        <th>Type</th>
                  
                        <th>Registered At</th>
                        <th>Statut</th>
                        <th>Modify</th>
                        
                  </tr>
                  <tr v-for="user in users.data" :key="user.id">

                    <td>{{user.id}}</td>
                    <td>{{user.name}}</td>
                 
                    <td>{{user.email}}</td>
                    <td>{{user.type | textMaj}}</td>
                    <td>{{user.created_at | timeFilter}}</td>
             
                    <td><p v-if="user.bio === 'Active'" class="btn btn-danger"  >{{user.bio}}</p>
                    <p v-else class="btn btn-primary"  >{{user.bio}}</p>
                    </td>

                    <td>
                        <a href="#" @click='editUser(user)'>
                            <i class="fa fa-edit blue"></i>
                        </a>
                        /
                        <a href="#" @click='deleteUser(user.id)' >
                            <i class="fa fa-trash red"></i>
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
 
    <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 v-if="editMode" class="modal-title" id="exampleModalLabel">Modifier Utilisteur</h5>
        <h5 v-else-if="!editMode" class="modal-title" id="exampleModalLabel">Ajouter un utilisateur</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form @submit.prevent="editMode ? updateUser():createUser()">
      <div class="modal-body">
               
         <div class="form-group">
            
            <input v-model="form.name" placeholder="Nom" type="text" name="name"
                class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
            <has-error :form="form" field="name"></has-error>
            </div>

            <div class="form-group">
            
            <input v-model="form.cin" placeholder="CIN" type="text" name="cin"
                class="form-control" :class="{ 'is-invalid': form.errors.has('cin') }">
            <has-error :form="form" field="cin"></has-error>
            </div>


        <div class="form-group">
            
            <input v-model="form.email" placeholder="Address Email" type="email" name="email"
                class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
            <has-error :form="form" field="email"></has-error>
            </div>

         <div class="form-group">
             <input v-model="form.password" placeholder="Password" type="password" name="password"
                class="form-control" :class="{ 'is-invalid': form.errors.has('password') }">
            <has-error :form="form" field="password"></has-error>
            </div>

         <div class="form-group">
                <select name="type" v-model="form.type" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('type') }">
                            <option value="">Select User Role</option>
                            <option value="admin">Admin</option>
                            <option value="user">Technecien</option>
                            <option value="secretaire">Secretaire</option>
                        </select>
            <has-error :form="form" field="type"></has-error>
            
               </div>
            <div class="form-group">
                        <input disabled  v-model="form.bio" name="bio" id="bio"
                        placeholder="Inactive" value ="Inactive"
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
               $('#addUser').modal('show');
        },
         editUser(user){
           this.editMode=true;
          this.form.fill(user);
               $('#addUser').modal('show');
        },


            updateUser(){
                this.$Progress.start()
               this.form.put('api/user/'+this.form.id).then(()=>{
                 Fire.$emit('afterCrudeEvent');
                toast.fire({
                  icon: 'success',
                  title:'Utilisateur modifier avec succès'
                })
                 $('#addUser').modal('hide');
                
                  


               }).catch(()=>{
                   this.$Progress.fail()
               })
          this.$Progress.finish()
            },
            createUser(){
              this.$Progress.start()

               this.form.post('api/user').then(()=>{ 
                 toast.fire({
                  icon: 'success',
                  title:'Utilisateur crée avec succès'
                })
                $('#addUser').modal('hide');
                this.loadUser();})
         
                           
              
               this.$Progress.finish();
            },
            loadUser(){
              this.$Progress.start();
              axios.get("api/user").then(({ data }) => (this.users = data));
            this.$Progress.finish();
           },
           deleteUser(id){
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
           }
      },
      
        data(){
         
            return{
              users:{},
              editMode:false,
                form:new Form({
                  id:'',
                    name:'',
                    email:'',
                    password:'',
                    type:'',
                    cin:'',
                    payment:'',
                    bio:'',
                    photo:''
                })
            }
        },
        created() {
              Fire.$on('searching',() => {
                let query = this.$parent.search;
                axios.get('api/findUser?q=' + query)
                .then((data) => {
                    this.users = data.data
                })
                .catch(() => {
                  console.log('not found');
                })
            }),
            this.loadUser();
            Fire.$on('afterCrudeEvent',()=> {
              this.loadUser();
            });
        }
    }
    
</script>
