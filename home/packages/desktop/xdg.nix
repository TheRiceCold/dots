{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = let
      browser = "firefox.desktop";
      imageView = "swayimg";
    in {
      "x-scheme-handler/http" = [browser];
      "x-scheme-handler/https" = [browser];
      "application/xhtml+xml" = [browser];
      "text/html" = [browser];
      "text/xml" = [browser];

      "image/jpeg" = [imageView];
      "image/bmp" = [imageView];
      "image/gif" = [imageView];
      "image/jpg" = [imageView];
      "image/pjpeg" = [imageView];
      "image/png" = [imageView];
      "image/tiff" = [imageView];
      "image/webp" = [imageView];
      "image/x-bmp" = [imageView];
      "image/x-gray" = [imageView];
      "image/x-icb" = [imageView];
      "image/x-ico" = [imageView];
      "image/x-png" = [imageView];
      "image/x-portable-anymap" = [imageView];
      "image/x-portable-bitmap" = [imageView];
      "image/x-portable-graymap" = [imageView];
      "image/x-portable-pixmap" = [imageView];
      "image/x-xbitmap" = [imageView];
      "image/x-xpixmap" = [imageView];
      "image/x-pcx" = [imageView];
      "image/svg+xml" = [imageView];
      "image/svg+xml-compressed" = [imageView];
      "image/vnd.wap.wbmp" = [imageView];
      "image/x-icns" = [imageView];
    };
  };
}
