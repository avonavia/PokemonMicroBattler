   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   F    @PokemonMicroBattler.PokemonMicroBattler.Windows.PokemonAddWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	     � WindowStartupLocation$  CenterScreen=�5   	    � WindowState$ Normal=�5	   	    � 
ResizeMode$ CanResizeWithGrip=�5
   	    � SizeToContent$ Manual=�5   	    � Title$ Add Pokemon��5   	   $	��500��6   $	��800��6*    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5      5       5!      .��5#      � -   5         �Name$ MainGrid��5#      ��5$   
   �� 5%       �� ImageSource$? 9/PokemonMicroBattler.Templates/Backgrounds/background.jpg��6    j� Stretch$
 Fill=�6a    � ColumnDefinitions 5'   
   �� 5(      �� 5)      �� 5*       � RowDefinitions 5,      �� 5-      �� 5.      �� 5/      .+�54   
   �� -   5         ��Name$ 	AddButton��54      $��Add Pokemon��6$   $��Showcard Gothic)�6:   $��15(�6W   $��50��6e   $	��200��6q   $��Center=�6}   $��Center=�6�   #��[  6�   $��2��6�   $��1��6�   $��0,20,0,0q�6&  ��6�   Z�  J� Effect 55      3  -System.Windows.Media.Effects.DropShadowEffect  56      ��58      �� 59      $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��6   5;      �� 5=   
   -   5        $ 
BackButton��5=      $��50��6%   $��50��61   $
��Left=�6<   $	��Top=�6n   #��[  6�   $��0��6�   ��6W   Z�  5>        5?      ��5A      �� 5B      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6   5D      �� 5F   
   -   5         ��Name$ Type1Box��5F   o   $��2q�6   
���   �$��1��6;   $��Center=�6K   $��40��6�   $	��150��6�   $��Center=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��0��6�   $	��Top=�6�   $��0,10,0,0q�6   5G       �� Color��%S   (��       5H   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5I      5J      �� 5L   
   -   5        $ Type2Box��5L   o   $��2q�6   
���   �$��1��6;   $��Center=�6K   $��40��6�   $	��150��6�   $��Center=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��Center=�6�   $��0,10,0,0q�6�    5M      ��%S   (��       5N   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5O      5P      �� 5R   
   -   5         ��Name$ NameBox��5R      $��1��6#   $��40��63    �� TextWrapping$
 Wrap=�6?   $��Bottom=�6S   $	��200��6n   $��Showcard Gothic)�6z   $��25(�6�   $��0,10,0,0q�6�   �� 5S   
   -   5        $ DescBox��5S      $��1��6#   $��1��63   $��40��6@   $
 Wrap=�6L   $	��Top=�6`   $	��200��6x   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5T   
   -   5        $ 	WeigthBox��5T      $��1��6%   $��1��65   $��40��6B   $
 Wrap=�6N   $��Center=�6b   $	��200��6}   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5U   
   -	   5        $ 	HeightBox��5U      $��1��6%   $��1��65   $��40��6B   $
 Wrap=�6N   $��Bottom=�6b   $	��200��6}   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5V   
   -
   5        $ LevelBox��5V      $��1��6$   $��2��64   $��40��6A   $
 Wrap=�6M   $	��Top=�6a   $	��200��6y   $��Showcard Gothic)�6�   $��25(�6�   $��0,10,0,0q�6�   �� 5Y   
   $��Type 1:��6   $��0��6"   $��Right=�62   $��40��6N   $	��Top=�6Z   $	��100��6r   $��Showcard Gothic)�6~   $��25(�6�   �� 5Z   
   $��Type 2:��6   $��0��6"   $��Right=�62   $��40��6N   $��Center=�6Z   $	��100��6u   $��Showcard Gothic)�6�   $��25(�6�   �� 5[   
   $��Name:��6   $��0��6    $��Right=�60   $��40��6L   $��Bottom=�6X   $��88��6s   $��Showcard Gothic)�6~   $��25(�6�   �� 5]   
   $��Description:��6   $��0��6'   $��1��67   $��Right=�6D   $��40��6`   $	��Top=�6l   $	��182��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5^   
   $��Weight:��6   $��0��6"   $��1��62   $��Right=�6?   $��40��6[   $��Center=�6g   $	��123��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5_   
   $��Height:��6   $��0��6"   $��1��62   $��Right=�6?   $��40��6[   $��Bottom=�6g   $	��119��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5`   
   $��Evolve Level:��6   $��0��6(   $��2��68   $��Right=�6E   $��40��6a   $	��Top=�6m   $	��190��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5b   
   $��Moves:��6   $��2��6!   $��1��61   $��Center=�6>   $��40��6[   $��Bottom=�6g   $	��123��6�   $��Showcard Gothic)�6�   $��25(�6�   �� 5e   
   -   5        $ Move1Box��5e   |   $��2q�6   
���   �$��2��6;   $��2��6K   $��Center=�6X   $��40��6�   $	��120��6�   $
��Left=�6�   $��25(�6�   $��Showcard Gothic)�6�   $	��Top=�6�   $��0,0,10,0q�6   5f      ��%S   (��       5g   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5h      5i      �� 5k   
   -   5        $ Move2Box��5k   |   $��2q�6   
���   �$��2��6;   $��2��6K   $��Center=�6X   $��40��6�   $	��120��6�   $��Right=�6�   $��25(�6�   $��Showcard Gothic)�6�   $	��Top=�6�   $��0,0,10,0q�6   5l      ��%S   (��       5m   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5n      5o      �� 5q   
   -   5        $ Move3Box��5q   |   $��2q�6   
���   �$��2��6;   $��2��6K   $��Center=�6X   $��40��6�   $	��120��6�   $
��Left=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��Center=�6�    5r      ��%S   (��       5s   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5t      5u      �� 5w   
   -   5        $ Move4Box��5w   �   $��2q�6   
���   �$��2��6X   $��2��6h   $��Center=�6u   $��40��6�   $	��120��6�   $��Right=�6�   $��25(�6�   $��Showcard Gothic)�6�   $��Center=�6
  $��0,0,10,0q�6%  ��6'   �� *Name+ 5x      ��%S   (��       5y   "   *SystemColors.WindowBrushKey+)�� 6   $ 	#B2EDEBD6��6Q   5z      5{      5~      5�      