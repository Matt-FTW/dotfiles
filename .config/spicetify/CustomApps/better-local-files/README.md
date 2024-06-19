# Better local files

View your local songs, albums and artists.

![preview](https://raw.githubusercontent.com/Pithaya/spicetify-apps/main/custom-apps/better-local-files/preview.png)

> **Note**  
> There is a specific way to format artists so that the custom app recognizes them correctly: see [limitations](#limitations).
>
> If you have an issue with albums with the same name being merged, see [Albums with the same name from different artists](#albums-with-the-same-name-from-different-artists).

## Features

-   Tracks, albums, and artists views
-   Supports filtering and sorting
-   Supports all languages available in Spotify.

![preview](https://raw.githubusercontent.com/Pithaya/spicetify-apps/main/custom-apps/better-local-files/docs/tracks.png)

## Installation

1. Run `spicetify config-dir` to open the spicetify folder.
2. Go to the `CustomApps` folder.
3. Create a `better-local-files` folder.
4. Download the custom app files as a zip from [here](https://github.com/Pithaya/spicetify-apps-dist/archive/refs/heads/dist/better-local-files.zip).
5. Extract the zip and put the files inside the folder you created in step 3.

Then, run the following commands:

```sh
spicetify config custom_apps better-local-files
spicetify apply
```

## Limitations

### Song artists

Spotify doesn't seem to recognize separate artist tags on songs as different artists, and will instead use the concatenation of the artist's names. So a track with artists 'A' and 'B' will be considered as having a single artist: 'A, B'.  
The custom app parses these strings with the following delimiters: ', ' and '; '. You should use this format to get artists recognized properly.  
**Note**: This means that artists with the same name will be **considered the same artist**.

### Album artists

Album artists tags are not recognized, so the custom app will use the list of all artists from the album's tracks as the album's artists.

### Artist images

As artist images are not available, the artist's first album's image will be used instead.

## Albums with the same name from different artists

To identify an album, Spotify uses the current track's artist(s) name and the album name. This means that albums with tracks from different artists will be considered separate albums.  
To fix this, the custom app groups albums by name.  
This means that albums with the same name will be **considered the same album**.

If you find that you have albums with the same name that are being merged when they shouldn't, you can use the **settings menu** to **rebuild the local album cache**. This will try to group tracks that share the same album name correctly by comparing the album covers.

Note that for performance reasons this behaviour is **not enabled by default**. If you add new albums that have the same issue later on, you will need to **rebuild the cache manually again**.

![preview](https://raw.githubusercontent.com/Pithaya/spicetify-apps/main/custom-apps/better-local-files/docs/build-cache.PNG)

The cache can take some time to be built depending on how many tracks you have and how large the cover images are.

The **clear album cache** menu item allows you to clear the cache and go back to the default behavior.

## Upcoming features

-   Artist's album list
-   Multi track selection
-   Keep search, sort, and scroll information on navigation

## Uninstall

1. Run `spicetify config-dir` to open the spicetify folder
2. Go to the `CustomApps` folder
3. Delete the `better-local-files` folder

Then, run the following commands:

```sh
spicetify config custom_apps better-local-files-
spicetify apply
```
