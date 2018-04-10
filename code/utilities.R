convert_feature_names_to_id <- function(data){
  feature_name_lookup <- create_feature_name_lookup(data)
  idx <- match(feature_name_lookup$name, colnames(data))
  colnames(data)[idx] <- feature_name_lookup$id
  return(data)
}

  create_feature_name_lookup <- function(data){
    feature_names <- colnames(data)
    feature_name_lookup <- tibble(
      name = colnames(data)[-(1:2)],
      id = paste0("f_", 1:(length(name)))
    )
    return(feature_name_lookup)
  }


export_prediction <- function(prediction, data){
  prediction %>%
    mutate(sequence = data$sequence) %>%
    select(sequence, life, death) %>%
    rename(functional = "life", `non-functional` = "death") %>%
    write_csv("data/sample_output.csv")
}
