# 14/03/2021 code for charts:


#FREETHROWS
####################################################################################
FTM <- ggplot(freethrows, aes(x = nameTeam, y = ftm, fill = nameTeam)) +
  geom_bar(width = 0.35, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Free Throws Made (Rank)",fill="")+
  geom_text(aes(label = paste0(ftm," (",rankFTM,")",sep="")), 
            size = 4.25, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()

FTA <- ggplot(freethrows, aes(x = nameTeam, y = fta, fill = nameTeam)) +
  geom_bar(width = 0.35, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Free Throws Attempted (Rank)",fill="")+
  geom_text(aes(label = paste0(fta," (",rankFTA,")",sep="")), 
            size = 4.25, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()

FTPCT <- ggplot(freethrows, aes(x = nameTeam, y = pctFT, fill = nameTeam)) +
  geom_bar(width = 0.35, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Free Throw Percentage (Rank)",fill="")+
  geom_text(aes(label = paste0(pctFT*100,"%"," (",pctFTRank,")",sep="")), 
            size = 4.25, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()

FTRATE <- ggplot(freethrows, aes(x = nameTeam, y = FTRate, fill = nameTeam)) +
  geom_bar(width = 0.35, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Free Throw Rate (Rank)",fill="")+
  geom_text(aes(label = paste0(round(FTRate*100,1),"%"," (",rankFTRate,")",sep="")), 
            size = 4.25, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()


ftPlot <- (FTA | FTM) / (FTPCT | FTRATE) +
  plot_annotation(
    title = 'Getting to the FT Line',
    subtitle = 'Comparing offensive team stats: Ryan Saunders vs Chris Finch',
    caption = 'Source: stats.NBA.com \nFilippos Polyzos | @filippos_pol'
  ) +
  plot_layout(guides = 'collect')

ggsave("freethrows.png",ftPlot,width=12,height=10,dpi=700)
####################################################################################



#MISC
####################################################################################
OFFTOV <- ggplot(misc, aes(x = nameTeam, y = ptsOffTOV, fill = nameTeam)) +
  geom_bar(width = 0.5, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Points Off Turnovers (Rank)",fill="")+
  geom_text(aes(label = paste0(ptsOffTOV," (",ptsOffTOVRank,")",sep="")), 
            size = 4, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()

SECOND <- ggplot(misc, aes(x = nameTeam, y = ptsSecondChance, fill = nameTeam)) +
  geom_bar(width = 0.5, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Second Chance Points (Rank)",fill="")+
  geom_text(aes(label = paste0(ptsSecondChance," (",ptsSecondChanceRank,")",sep="")), 
            size = 4, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()

FASTBREAK <-ggplot(misc, aes(x = nameTeam, y = ptsFastBreak, fill = nameTeam)) +
  geom_bar(width = 0.5, stat = "identity", color = "white") +
  scale_fill_manual(values = c("#0C2340","#78BE20"))+
  labs(x="",y="Fast Break Points (Rank)",fill="")+
  geom_text(aes(label = paste0(ptsFastBreak," (",ptsFastBreakRank,")",sep="")), 
            size = 4, color="white",
            position = position_stack(vjust = 0.5), family="Bahnschrift") +
  theme_white()


miscPlot <- (OFFTOV | SECOND | FASTBREAK) +
  plot_annotation(
    title = 'How the Wolves generate points',
    subtitle = 'Comparing offensive team stats: Ryan Saunders vs Chris Finch',
    caption = 'Source: stats.NBA.com \nFilippos Polyzos | @filippos_pol'
  ) +
  plot_layout(guides = 'collect')

ggsave("misc.png",miscPlot,width=10,height=8,dpi=700)
####################################################################################















