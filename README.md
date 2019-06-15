# README

This README would normally document whatever steps are necessary to get the
application up and running.

# Bass Music

  * Bass wants a Rails app for their music streaming service. Here’s what it looks like. Albums are displayed on the main page. Clicking on an album takes users to a page where they can see an album’s track listing.

  * Here’s what we’ll need to build this app:

    - The first piece of data we need to store is an album. An album contains a cover, title, and artist. This means we’ll need an Album model to store this data.

    - The second piece of data we need to store is a track. A track contains a song’s name and duration. This means we’ll need a Track model to store this data.

    - We can connect an album to its tracks using a has_many / belongs_to association


  * Generate a model named Album.
  > rails g model Album

  * Generate a model named Track.
  > rails g model Track

  * Associate the Album model with the Track model using the has_many and belongs_to methods.
  > app/models/album
  has_many :tracks

  > app/models/track
  belongs_to :album

  * Open up the migration file in db/migrate/ for the albums table, and add the following columns:

    - a string column called cover
      > t.string :cover

    - a string column called title
      > t.string : title

    - a string column called artist
      > t.string :artist

    * Open the migration file in db/migrate for the tracks table, and add the following columns:

      - a string column called name
      > t.string :name

      - a string column called minutes
      > t.string :minutes

      - a references column to the Album model
      > t.refernces :album

    * The references column is needed because the Track model has a belongs_to association with the Album model.

    * Run a migration to update the database with the Album model and Track model.

    * We’ve prepared a few items here to seed the database with albums and tracks. Copy these items and paste them into your db/seeds.rb.

    * Then in db/seeds.rb:
    > https://s3.amazonaws.com/codecademy-content/projects/3/bass-music/seeds.rb.html

    * Run rake db:seed to seed the database with the data in db/seeds.rb.

# Add a controller and routes

  * Generate a controller named Albums.
    > rails g controller Albums

  * In the routes file, add the resource route for the Albums controller.
    > resources :albums

  * Run the rake routes command in the terminal to view all of the new URLs that the resource route created.

  * We need an action to display a list of all albums, and another action to display a specific album. Looking at Rails’ seven standard controller actions, we can use albums#index and albums#show.

# Add controller actions and views

  * We’ve prepared a layout file for the project here. Copy this HTML and paste it into your app/views/layouts/application.html.erb
    > https://s3.amazonaws.com/codecademy-content/projects/3/bass-music/application.html

  * Set up the albums#index controller action:

  * In the Albums controller, make an action named index that retrieves all albums from the database, and saves it into a variable named @albums.
    > @albums = Album.all

  * In the view app/views/albums/index.html.erb, loop through each element in @albums and display an album’s details.
    ```html
      <div class="row">
        <%= @albums.each do |a| %>
          <div class="col-md-3">
            <div class="thumbnail">
              <%= link_to (image_tag(a.cover)), album_path(a) %>
              <div class="caption">
                <h3 class="title"> <%= a.title %> </h3>
                <p class="artist"> <%= a.artist %> </p>
              </div>
            </div>
          </div>
        <% end %>
      </div>
    ```

    * In the routes file, set the index action as the root route. View the result by running your project.

    * Start a Rails server to preview the app in the browser. In the terminal, type: rails s -p 4001. This command starts a Rails server listening on port 4001. Then visit http://localhost:4001 to see your app in the browser.

# Set up the albums#show controller action:

  * In the Albums controller, make an action named show. Retrieve a single album, and save it in @album. Then retrieve all of its tracks, and save them in @tracks.
    ```ruby
      def show
        #code
        @albums = Album.find(params[:id])
        @tracks = @albums.tracks
      end
    ```

  * Finish the view app/views/albums/show.html.erb. First display an album’s details again. Then, loop through each track and display its information.
    ```html
      
    ```

Restart the Rails server and view the result by visiting http://localhost:4001/. Click on an album cover to see its tracks. To restart a Rails server, in the terminal, first press Ctrl+C to shut down the server. Then type rails server to restart it.

css
