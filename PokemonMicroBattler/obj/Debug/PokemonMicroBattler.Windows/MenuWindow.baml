   M S B A M L   `   `   `  ����  PokemonMicroBattler$    PokemonMicroBattler.MenuWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � WindowState$ Normal=�5   	    � 
ResizeMode$ CanResizeWithGrip=�5	   	    � SizeToContent$ Manual=�5
   	    � Title$
 Menu��5   	   $	��500��6   $	��800��6#    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5      5      5       .��5"      � -   5         �Name$ MainGrid��5"      ��5#   
   �� 5$       �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg��6    j� Stretch$
 Fill=�6a    � RowDefinitions 5&   
   �� 5'      $
��Auto �6   6,   �� 5(      $
��Auto �6   6,   �� 5)      $��* �6   6)    � ColumnDefinitions 5+   
   �� 5,      �� 5-      $
��Auto �6   �� 5.      .+�50   
   �� -   5         ��Name$
 Logo��50      $��Center=�6   $	��Top=�6;   $I��C/PokemonMicroBattler.Templates/Other/logo_new_transparent_small.png��6S   $
��None=�6�   $��0��6�   $��1��6�   �� 51   
   -   5         ��Name$ PokedexButton��51      $	��102��6(   $
��Left=�65   $��Bottom=�6P   $	��107��6k   #��[  6�   $��1��6�   $��1��6�   ��6w   Z�  J� Effect 52      3  -System.Windows.Media.Effects.DropShadowEffect  53      ��55      �� 56      $6 0/PokemonMicroBattler.Templates/Other/pokedex.png��6   58      �� 59   
   -   5        $ BattleButton��59      $	��102��6'   $	��107��64   $��Right=�6@   $��Bottom=�6s   #��[  6�   $��1��6�   $��1��6�   ��6\   Z�  5:        5;      ��5=      �� 5>      $5 //PokemonMicroBattler.Templates/Other/battle.png��6   5@      �� 5A   
   -   5        $ 	LogButton��5A      $��30��6$   $��30��60   $
��Left=�6;   $��Bottom=�6m   #��[  6�   $��1��6�   $��2��6�   ��6V   Z�  5B        5C      ��5E      �� 5F      $7 1/PokemonMicroBattler.Templates/Other/notebook.png��6   5H      �� 5I   
   -   5        $ SettingsButton��5I      $��70��6)   $��70��65   $
��Left=�6@   $	��Top=�6r   #��[  6�   $��0��6�   $��0��6�   ��6[   Z�  5J        5K      ��5M      �� 5N      $7 1/PokemonMicroBattler.Templates/Other/settings.png��6   5P      5Q      5S      