   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   J    DPokemonMicroBattler.PokemonMicroBattler.Windows.ChooseSettingsWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � WindowState$ Normal=�5	   	    � 
ResizeMode$ CanResizeWithGrip=�5
   	    � SizeToContent$ Manual=�5   	    � Title$ Settings��5   	   $	��500��6   $	��800��6'    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5      5       5!      .��5#      � -   5         �Name$ MainGrid��5#      ��5$   
   �� 5%       �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg��6    j� Stretch$
 Fill=�6a    � RowDefinitions 5'   
   �� 5(      �� 5)      �� 5*      .+�5.   
   �� -   5         ��Name$ Setting1Button��5.      $��Add Pokemon��6)   $��Showcard Gothic)�6?   $��15(�6\   $��50��6j   $	��300��6v   $��Center=�6�   $	��Top=�6�   #��[  6�   $��1��6�   $��0��6   ��6�   Z�  J� Effect 5/      3  -System.Windows.Media.Effects.DropShadowEffect  50      ��52      �� 53      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   55      �� 57   
   -   5        $ Setting2Button��57      $��50��6)   $	��300��65   $��Center=�6A   $��Add Move��6^   $��Showcard Gothic)�6q   $��15(�6�   $��Bottom=�6�   #��[  6�   $��1��6�   $��0��6   ��6�   Z�  58        59      ��5;      �� 5<      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   5>      �� 5@   
   -   5        $ 
BackButton��5@      $��50��6%   $��50��61   $
��Left=�6<   $	��Top=�6n   #��[  6�   $��0��6�   ��6W   Z�  5A        5B      ��5D      �� 5E      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6   5G      5I      5K      