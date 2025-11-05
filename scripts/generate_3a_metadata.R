# Script to generate 3A specific metadata
metadatas = list.files("datasets", pattern = "*.Rmd", full.names = TRUE, recursive = TRUE)

metadatas |>
	purrr::walk2(
		basename(metadatas),
		function(input_path, input_file) {
			output_file = gsub(".Rmd", "_3a.pdf", input_file, fixed = TRUE)
			output_path = gsub(input_file, output_file, input_path, fixed = TRUE)
			
			rmarkdown::render(
				input_path, output_file = output_file,
				params = list(
					questions        = FALSE,
					instructions     = TRUE,
					instruction_file = here::here("instructions", "instructions_3a.Rmd")
				)
			)
		}
	)
