#include <gtk/gtk.h>

static void on_activate(GApplication *app, gpointer user_data) {
  GtkWindow *window =
      GTK_WINDOW(gtk_application_window_new(GTK_APPLICATION(app)));
  gtk_window_set_title(window, "GTK4 Nix + CMake");
  gtk_window_set_default_size(window, 400, 200);

  GtkWidget *label = gtk_label_new("Hello from GTK4!");
  gtk_window_set_child(window, label);

  gtk_window_present(window);
}

int main(int argc, char **argv) {
  GtkApplication *app =
      gtk_application_new("com.example.gtk4", G_APPLICATION_DEFAULT_FLAGS);
  g_signal_connect(app, "activate", G_CALLBACK(on_activate), NULL);

  int status = g_application_run(G_APPLICATION(app), argc, argv);
  g_object_unref(app);
  return status;
}
