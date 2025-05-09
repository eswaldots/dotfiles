import { createRootRoute, Outlet } from '@tanstack/react-router'
import { load } from '@tauri-apps/plugin-store'

export const Route = createRootRoute({
  component: () => {
    return (
      <>
        <main>
          <Outlet />
        </main>
      </>
    )
  },
  loader: async () => {
      const store = await load("settings.json", { autoSave: false });
      const darkMode = (await store.get("dark_mode")) as string;
      const colorScheme = (await store.get("color_scheme")) as string;
      
    const rootElement = document.getElementById('root')!;
      rootElement.style.setProperty("--primary", colorScheme);
      rootElement.classList.add(darkMode ? "dark" : "light");
      rootElement.classList.remove(darkMode ? "light" : "dark");
    }
})
