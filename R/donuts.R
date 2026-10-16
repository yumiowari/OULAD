library(ggplot2)

# Gráfico de rosca é essencialmente um gráfico de barras empilhadas que
# foi curvado em um círculo.
gender_donut <- function(student_info){
  chart <- ggplot(student_info, aes(x=2, fill=gender)) +
    geom_bar(width=1, color="white", linewidth=2) +
    # Adiciona a camada de gráfico de barras.
    
    geom_text(stat="count", aes(label=after_stat(count)),
              position=position_stack(vjust=0.5),
              color="white", size=5, fontface="bold") +
    # Contabiliza as linhas para cada gênero.
    
    coord_polar("y", start=0) +
    # Curva o gráfico de barras empilhadas ao longo do eixo Y, unindo as pontas
    # para formar um anel circular completo.
    
    xlim(0.5, 2.5) +
    # Exibe o espaço do eixo X do gráfico que vai de 0.5 até 2.5.
    # Como a barra foi desenhada na posição 2, todo o espaço interno (de 0.5 
    # até 1.5) é renderizado, embora completamente vazio. A curvatura torna 
    # esse espaço vazio no furo do gráfico de rosca.
    
    theme_void() +
    # Remove elementos de fundo, incluindo linhas de grade.
    
    theme(plot.title=element_text(hjust=0.5)) +
    # Centraliza o título no topo da imagem.
    
    scale_fill_manual(values=c("M"="#80bca3", "F"="#e6ac27"),
                      labels=c("M"="Masculino", "F"="Feminino")) +
    # Define a legenda.
    
    labs(title="Distribuição de Alunos por Gênero", fill="Gênero")
    
  print(chart)
}