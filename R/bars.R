# Gráficos de Barra
#
# Atividade 1, Tópicos Especiais em Inteligência Artificial
#
# Rafael Renó Corrêa, 16 de nov. de 2026

library(showtext)
library(ggplot2)
library(RColorBrewer)

region_bar <- function(student_info) {
  
  no_regions <- length(unique(student_info$region))
  # Contabiliza a quantidade de regiões para preparar o degradê
  
  # Ordena os níveis da variável "region" da menor para a maior frequência
  contagem <- table(student_info$region)
  student_info$region <- factor(
    student_info$region,
    levels = names(sort(contagem, decreasing = FALSE))
  )
  
  chart <- ggplot(student_info, aes(y = region, fill = region)) +
    geom_bar(width = 0.7) +
    
    scale_fill_manual(
      values = colorRampPalette(c("lightgray", "steelblue"))(no_regions)
      # Degradê acompanhando a ordenação (menor = mais claro, maior = mais escuro).
    ) +
    
    scale_y_discrete(
      labels = function(x) gsub(" Region", "", x)
      # Posiciona os rótulos das regiões à esquerda das barras, sem a palavra "Region"
    ) +
    
    scale_x_continuous(
      expand = expansion(mult = c(0, 0.05))
      # Ancora a base das barras à esquerda e mantém uma margem de respiro à direita.
    ) +
    
    theme_minimal() +
    theme(
      plot.title = element_text(hjust = 0.5),
      legend.position = "none",
      panel.grid.major.y = element_blank()
    ) +
    
    labs(
      title = "Distribuição de Alunos por Região",
      x = "Quantidade de Alunos",
      y = "Região"
    )
  
  print(chart)
}