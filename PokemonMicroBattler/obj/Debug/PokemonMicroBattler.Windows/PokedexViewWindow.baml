   M S B A M L   `   `   `  ����N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  5   	   G    APokemonMicroBattler.PokemonMicroBattler.Windows.PokedexViewWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     5   	   U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com  5   	     � WindowStartupLocation$  CenterScreen=�5	   	    � WindowState$ Normal=�5
   	    � 
ResizeMode$ CanResizeWithGrip=�5   	    � SizeToContent$ Manual=�5   	    � Title$ Pokemon Info��5   	   $	��500��6   $	��800��6+    � 	Resources 5         NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%�  &	        �� 5   
   " ��6$   .�5      ��  �@�OverridesDefaultStyle . 66   �� 5       �@�Cursor$
 Hand��6'   �� 5       � �� 5      �� 5      "	 ��6&   .R�5      �� $��border��6!   $��0q�6/   
���   �#��z��6W   ._�5      �� $��Center=�6/   $��Center=�6L   5      
 5      P� 5       �@J�IsMouseOver . . �5   "   ��  �@J�Opacity$	 0.8Q�6<   5      5      5       5!      5"      .��5$      � -   5         �Name$ MainGrid��5$      ��5%   
   �� 5&       �� ImageSource$> 8/PokemonMicroBattler.Templates/Backgrounds/pokedexUi.png��6    j� Stretch$
 Fill=�6`    � ColumnDefinitions 5(   
   �� 5)      �� 5*      �� 5+      �� 5,      �� 5-      �� 5.      �� 5/      �� 50       � RowDefinitions 53   
   �� 54      �� 55      �� 56      �� 57      �� 58      �� 59      �� 5:      �� 5;      �� 5<      �� 5=      .+�5?   
   �� -   5         ��Name$ PokeImg��5?      $��Center=�6!   $	��Top=�6>   $��1��6V   $��2��6f   $��2��6s   $��3��6�   $��0,0,70,0q�6�   �� 5@   
   -   5         ��Name$ 	NameBlock��5@       �� TextAlignment$
 Left=�6'   $��25��6<   $��4��6H   $��3��6X   $��1��6l   $��Showcard Gothic)�6y   $��20(�6�   �� 5A   
   -   5        $ 	DescBlock��5A      $
��Wrap=�6'   $��1��6;   $��6��6K   $��7��6_   $��2��6l   $��Showcard Gothic)�6}   $��15(�6�   �� 5B   
   -   5        $ HeightBlock��5B      $��10,0,0,0q�6)   $��Center=�6<   $
��Left=�6W   $��2��6r   $��6��6�   $��4��6�   $��Showcard Gothic)�6�   $��20(�6�   �� 5C   
   -   5        $ WeightBlock��5C      $��10,0,0,0q�6)   $��Center=�6;   $
��Left=�6V   $��2��6q   $��6��6�   $��5��6�   $��Showcard Gothic)�6�   $��20(�6�   �� 5E   
   -   5        $ 
LevelBlock��5E      $��Bottom=�6(   $��Right=�6C   $ Right=�6_   $��3��6u   $��3��6�   $��2��6�   $��Showcard Gothic)�6�   $��50(�6�   �� 5F   
   -   5        $ 
Type1Block��5F      $ Center=�6(   $��4��6?   $��2��6O   $��Showcard Gothic)�6\   $��20(�6y   �� 5G   
   -	   5        $ 
Type2Block��5G      $ Center=�6(   $��6��6?   $��2��6O   $��Showcard Gothic)�6\   $��20(�6y   �� 5I   
   -
   5         ��Name$ 
BackButton��5I      #��[  6U   $��0,0,0,10q�6z   ��6>   Z� ��5J      �� 5K      $4 ./PokemonMicroBattler.Templates/Other/arrow.png��6   $ Uniform=�6Z   5M      5N      5P      