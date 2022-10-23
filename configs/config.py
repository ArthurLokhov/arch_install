# Wallpaper
wallpaper_path = os.path.expanduser("~") + "/.local/share/backgrounds/"
screens = Screen(
    top=bar.Bar(
        widgets=init_bar_widgets(primary=False),
        size=24,
        margin=[5, 5, 0, 5],
    ),
    wallpaper=wallpaper_path + "<wallpaper_name>.png", # you need to add this for each screen
    wallpaper_mode="fill"
),