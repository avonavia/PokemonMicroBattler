   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   C    =PokemonMicroBattler.PokemonMicroBattler.Windows.MoveAddWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � WindowState$ Normal=�5	   	    � 
ResizeMode$ CanResizeWithGrip=�5
   	    � SizeToContent$ Manual=�5   	    � Title$ Add Move��5   	   $	��500��6   $	��800��6'    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5      5       5!      .��5#      � -   5         �Name$ MainGrid��5#      ��5$   
   �� 5%       �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg��6    j� Stretch$
 Fill=�6a    � ColumnDefinitions 5'   
   �� 5(      �� 5)      �� 5*       � RowDefinitions 5,   
   �� 5-      �� 5.      �� 5/      .+�54   
   �� -   5         ��Name$ 	AddButton��54      $��Add Move��6$   $��Showcard Gothic)�67   $��15(�6T   $��50��6b   $	��200��6n   $��Center=�6z   $	��Top=�6�   #��[  6�   $��2��6�   $��1��6�   $��0,20,0,0q�6   ��6�   Z�  J� Effect 55      3  -System.Windows.Media.Effects.DropShadowEffect  56      ��58      �� 59      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   5;      �� 5=   
   -   5        $ 
BackButton��5=      $��50��6%   $��50��61   $
��Left=�6<   $	��Top=�6n   #��[  6�   $��0��6�   ��6W   Z�  5>        5?      ��5A      �� 5B      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6   5D      �� 5F   
   -   5         ��Name$ TypeBox��5F   o   $��2q�6   
���   �$��1��6;   $��Center=�6K   $��40��6�   $	��150��6�   $��Center=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��Center=�6�   $��0,10,0,0q�6�    5G       �� Color��%S   (��       5H   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5I      5J      �� 5L   
   -   5         ��Name$ NameBox��5L      $��1��6#   $��40��63    �� TextWrapping$
 Wrap=�6?   $��Bottom=�6S   $	��200��6n   $��Showcard Gothic)�6z   $��25(�6�   $��0,10,0,0q�6�   �� 5M   
   -   5        $ PowerBox��5M      $��1��6$   $��1��64   $��40��6A   $
 Wrap=�6M   $	��Top=�6a   $	��200��6y   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5N   
   -   5        $ AccBox��5N      $��1��6"   $��1��62   $��40��6?   $
 Wrap=�6K   $��Center=�6_   $	��200��6z   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5O   
   $��Type:��6   $��0��6    $��Right=�60   $��40��6L   $��Center=�6X   $��88��6s   $��Showcard Gothic)�6~   $��25(�6�   �� 5P   
   $��Name:��6   $��0��6    $��Right=�60   $��40��6L   $��Bottom=�6X   $��88��6s   $��Showcard Gothic)�6~   $��25(�6�   �� 5Q   
   $��Power:��6   $��0��6!   $��1��61   $��Right=�6>   $��40��6Z   $	��Top=�6f   $	��110��6~   $��Showcard Gothic)�6�   $��25(�6�   �� 5R   
   $��	Accuracy:��6   $��0��6$   $��1��64   $��Right=�6A   $��40��6]   $��Center=�6i   $	��150��6�   $��Showcard Gothic)�6�   $��25(�6�   5U      5W      