use crate::{definitions::{app_definitions::Module, responses_model::GenericPost}, services};

#[tauri::command]
pub async fn change_database_pool(
    app_handle: tauri::AppHandle,
    module: Module,
) -> Result<GenericPost, GenericPost> {
    match services::database_service::change_database_pool(&app_handle, module).await {
        Ok(_) => Ok(GenericPost {
            success: true,
            error: None,
        }),
        Err(err) => {
            let error_message = err.to_string();
            println!("Error changing database pool: {}", error_message);

            if let Err(e) = services::database_service::initialize_local_database(&app_handle).await {
                println!("Error initializing local database: {}", e);
            };


            Err(GenericPost {
                success: false,
                error: Some(error_message),
            })
        }
    }
}