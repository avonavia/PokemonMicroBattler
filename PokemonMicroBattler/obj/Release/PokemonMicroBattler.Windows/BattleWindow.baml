   M S B A M L   `   `   `  ���� N  JPokemonMicroBattler, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullq=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows/PokemonMicroBattler.PokemonMicroBattler.Windows  B    <PokemonMicroBattler.PokemonMicroBattler.Windows.BattleWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     @d2http://schemas.microsoft.com/expression/blend/2008     Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     Olocal=clr-namespace:PokemonMicroBattler.PokemonMicroBattler.Windows     U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com    � WindowStartupLocation$  CenterScreen=� � WindowState$ Normal=� � 
ResizeMode$ CanResizeWithGrip=� � SizeToContent$ Manual=� � Title$ Battle��$	��500��$	��800�� � 	Resources    NormalHover �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� Triggers P� Property P� Value��%  &	        �� " ��.���  �@�OverridesDefaultStyle . ��  �@�Cursor$
 Hand����  � �� �� "	 ��.R��� $��border��$��0q�
���   �#��z��._��� $��Center=�$��Center=�
 P�  �@J�IsMouseOver . . ���  �@J�Opacity$	 0.8Q�.��� -    �Name$ MainGrid������  �� ImageSource$E ?/PokemonMicroBattler.Templates/Backgrounds/battlebackground.jpg�� j� Stretch$
 Fill=� � RowDefinitions �� $
��149* ��� $	��73* ��� $	��20* � � ColumnDefinitions �� $
��399* ��� $	��56* ��� $
��311* ��� $	��35* �.+�� $	��170��$	��Top=�.+��� 
�������
���iii�$��5���� -    ��Name$ 
BattleText��
���   �$
��Wrap=�$��Showcard Gothic)�$��20(�$��10q�$��Center=�$��Center=��� -    ��Name$ 
BackButton��$y�Hidden=�$��50��$	��120��$��Bottom=�$��Right=�#��[  ��Z� ���� $4 ./PokemonMicroBattler.Templates/Other/arrow.png��$ Uniform=�� $��Right=�$��Bottom=�.+��� 
���/���
���iii�$��3���� $4��./PokemonMicroBattler.Templates/Other/heart.png��$��20��$
��Left=�$��5,0,0,0q��� $4��./PokemonMicroBattler.Templates/Other/heart.png��$��20��$��Right=�$��0,0,5,0q��� -   $ Player1Health��$��1q� �� TextAlignment$ Center=�$��30��$	��130��$��Showcard Gothic)�$��20(�� $
��Left=�$��Bottom=�$��2��.+��� 
���/���
���iii�$��3���� $4��./PokemonMicroBattler.Templates/Other/heart.png��$��20��$
��Left=�$��5,0,0,0q��� $4��./PokemonMicroBattler.Templates/Other/heart.png��$��20��$��Right=�$��0,0,5,0q��� -   $ Player2Health��$��1q�$ Center=�$��30��$	��130��$��Showcard Gothic)�$��20(��� -    ��Name$ Poke1��$��Right=�$	��Top=�$	��140��$	��140��$��0��$��1���� -   $ Poke2��$
��Left=�$��Bottom=�$	��140��$	��140��$��2��$��0��$��0,0,0,50q��� -   $ 
Player1Hit��$y�Hidden=�"  WpfAnimatedGif.ImageBehavior   AnimatedSource$2 ,/PokemonMicroBattler.Templates/Other/hit.gif��$��Right=�$	��Top=�$	��200��$	��200��$��0��$��1��$��	0,0,100,0q��� -	   $ 
Player2Hit��$y�Hidden=�$2 ,/PokemonMicroBattler.Templates/Other/hit.gif��$
��Left=�$��Bottom=�$	��200��$	��200��$��2��$��0���� -
   $ Attack1��$��Showcard Gothic)�$��1��$��2��$��50��$	��120��$	��Top=�$
��Left=�#��[  ��Z� ���� $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��$ Uniform=��� -   $ Attack2��$��Showcard Gothic)�$��1��$��2��$��50��$	��120��$	��Top=�$��Right=�#��[  ��Z� ���� $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��$ Uniform=��� -   $ Attack3��$��Showcard Gothic)�$��1��$��2��$��50��$	��120��$��Bottom=�$
��Left=�#��[  ��Z� ���� $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��$ Uniform=��� -   $ Attack4��$��Showcard Gothic)�$��1��$��2��$��50��$	��120��$��Bottom=�$��Right=�#��[  ��Z� ���� $; 5/PokemonMicroBattler.Templates/Other/attackbutton.png��$ Uniform=�