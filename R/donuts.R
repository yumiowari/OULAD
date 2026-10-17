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
    
    guides(fill=guide_legend(override.aes=list(linewidth=1))) +
    # Redefine o linewidth para a legenda.
    
    labs(title="Distribuição de Alunos por Gênero", fill="Gênero")
    
  print(chart)
}

age_donut <- function(student_info){
  chart <- ggplot(student_info, aes(x=2, fill=age_band)) +
    geom_bar(width=1, color="white", linewidth=0.5) + 
                                     # 2 -> 0.5 garante visibilidade para >=55.
    
    # Camada 1: Rótulos internos (texto branco, centrado em x=2)
    geom_text(stat="count", 
              aes(label=ifelse(after_stat(count)>=1000, after_stat(count), "")),
              position = position_stack(vjust=0.5),
              color="white", size=5, fontface="bold") +
    
    # Camada 2: Rótulos externos (texto escuro, deslocado para x=2.7)
    geom_text(stat="count", 
              aes(x=2.7, 
                  label=ifelse(after_stat(count)<1000, after_stat(count), "")),
              position=position_stack(vjust=0.5),
              color="black", size=5) +
    
    scale_color_identity() +
    coord_polar("y", start=0) +
    xlim(0.5, 3.0) + # 0.5 -> 3.0 garante espaço para a label externa.
    theme_void() +
    theme(plot.title=element_text(hjust=0.5)) +
    scale_fill_manual(values=c("0-35"="#a1dbb2", 
                               "35-55"="#fee5ad", 
                               "55<="="#faca66"),
                      labels=c("0-35"="0–35", 
                               "35-55"="35–55", 
                               "55<="=">=55")
                     ) +
    guides(fill=guide_legend(override.aes=list(linewidth=1))) +
    labs(title="Distribuição de Alunos por Idade", fill="Idade")
  print(chart)
}

library(RColorBrewer)

region_donut <- function(student_info){
  
  no_regions <- length(unique(student_info$region))
  
  chart <- ggplot(student_info, aes(x=2, fill=region)) +
    geom_bar(width=1, color="white", linewidth=2) +
    # geom_text() removido para ocultar os rótulos.
    coord_polar("y", start=0) +
    xlim(0.5, 2.5) +
    scale_fill_manual(
      values = colorRampPalette(c("#b9d9b4", "#288d85"))(no_regions),
      # Aplica paleta de cores com tonalidades de azul.
      
      labels = function(x) gsub(" Region", "", x)
      # Remove "Region" das legendas dinamicamente.
    ) +
    theme_void() +
    theme(plot.title=element_text(hjust=0.5)) +
    guides(fill=guide_legend(override.aes=list(linewidth=1))) +
    labs(title="Distribuição de Alunos por Região", fill="Região")
  print(chart)
}